part of '../../openim_web_impl.dart';

/// Web implementation of [OpenIMManager].
/// Uses WASM + JS Interop instead of FFI + Isolate.
class OpenIMManager {
  /// Pending operation completers (replaces _sendPortMap from native)
  static final Map<String, Completer<_PortResult>> _pendingOps = {};

  /// Event handler for WASM callbacks
  static final WebEventHandler _eventHandler = WebEventHandler();

  /// Event stream subscription
  static StreamSubscription<Map<String, dynamic>>? _eventSubscription;

  static IMPlatform getIMPlatform() {
    return IMPlatform.web;
  }

  /// 初始化
  static Future<bool> init({
    required String apiAddr,
    required String wsAddr,
    String? dataDir,
    int logLevel = 0,
    String? operationID,
    bool isLogStandardOutput = false,
    String? logFilePath,
    bool isExternalExtensions = false,
  }) async {
    try {
      // Step 1: Ensure WASM engine is loaded
      debugPrint('[OpenIM] Step 1: Loading WASM engine...');
      await loadOpenIMWasm();
      debugPrint('[OpenIM] Step 1: WASM engine loaded.');

      // Step 2: Register event callback FIRST (before initSDK)
      debugPrint('[OpenIM] Step 2: Registering event callback...');
      _eventHandler.registerEventCallback();
      debugPrint('[OpenIM] Step 2: Event callback registered.');

      // Step 3: Listen to events from WASM
      _eventSubscription?.cancel();
      _eventSubscription = _eventHandler.eventStream.listen(_handleWasmEvent);
      debugPrint('[OpenIM] Step 3: Event stream listening.');

      // Step 4: Call initSDK via JS interop
      final opID = IMUtils.checkOperationID(operationID);
      final config = jsonEncode({
        'platformID': IMPlatform.web.rawValue,
        'apiAddr': apiAddr,
        'wsAddr': wsAddr,
        'dataDir': dataDir ?? '/openim',
        'logLevel': logLevel,
        'isLogStandardOutput': isLogStandardOutput,
        'isExternalExtensions': isExternalExtensions,
      });

      debugPrint('[OpenIM] Step 4: Calling initSDK with config: $config');
      final result = jsInitSDK(opID.toJS, config.toJS);
      debugPrint('[OpenIM] Step 4: initSDK returned: $result');

      return true;
    } catch (e, s) {
      debugPrint('[OpenIM] init error: $e');
      debugPrint('[OpenIM] init stackTrace: $s');
      return false;
    }
  }

  /// Handle events received from WASM commonEventFunc
  static void _handleWasmEvent(Map<String, dynamic> event) {
    try {
      final eventName = event['event'] as String?;
      final errCode = event['errCode'];
      final errMsg = event['errMsg']?.toString();
      var data = event['data'];
      final opID = event['operationID']?.toString();

      // Normalize data: if it's a complex type (List/Map), re-encode to JSON 
      // string to match native FFI behavior where data is always a String.
      // NOTE: JSArray/JSObject from JS interop do NOT pass Dart's 'is List'/'is Map'
      // checks since they are JS extension types. The catch-all handles them.
      if (data is List || data is Map) {
        data = jsonEncode(data);
      } else if (data is num || data is bool) {
        data = data.toString();
      } else if (data != null && data is! String) {
        // Catch-all for JSArray, JSObject, JSAny and any other non-Dart types
        data = js2dartString(data);
      }

      // Check if this is a response to a pending operation
      if (opID != null && opID.isNotEmpty && _pendingOps.containsKey(opID)) {
        final completer = _pendingOps.remove(opID)!;
        if (errCode != null && errCode != 0) {
          completer.complete(_PortResult(
            error: errMsg ?? 'Unknown error',
            errCode: errCode is int ? errCode : int.tryParse(errCode.toString()),
            callMethodName: eventName,
          ));
        } else {
          completer.complete(_PortResult(data: data));
        }
        return;
      }

      // Otherwise, it's a listener event — dispatch to listeners
      if (eventName != null) {
        final portModel = _PortModel(
          method: eventName,
          data: data,
          errCode: errCode,
          operationID: opID,
        );
        try {
          _listenWeb(portModel);
        } catch (e) {
          debugPrint('[OpenIM] _listenWeb error for event "$eventName": $e, data type: ${data?.runtimeType}');
        }
      }
    } catch (e) {
      debugPrint('_handleWasmEvent error: $e');
    }
  }

  /// Convert a JS result to a Dart String, handling both JSAny and 
  /// already-dartified values (List, Map, int, etc.)
  static String? js2dartString(dynamic result) {
    if (result == null) return null;
    // Already a Dart String
    if (result is String) return result;
    // Check JSAny types FIRST — JSArray/JSObject don't pass Dart's 
    // 'is List'/'is Map' checks since they are JS extension types.
    if (result is JSAny) {
      if (result.isUndefined || result.isNull) return null;
      if (result.typeofEquals('string')) {
        return (result as JSString).toDart;
      }
      if (result.typeofEquals('number')) {
        return (result as JSNumber).toDartDouble.toString();
      }
      if (result.typeofEquals('boolean')) {
        return (result as JSBoolean).toDart.toString();
      }
      // Object/Array - stringify via JS JSON.stringify
      final jsJSON = globalContext.getProperty<JSObject>('JSON'.toJS);
      final stringified = jsJSON.callMethod<JSString>('stringify'.toJS, result);
      return stringified.toDart;
    }
    // Pure Dart types (List, Map, int, etc.) - serialize to JSON string
    if (result is List || result is Map || result is num || result is bool) {
      return jsonEncode(result);
    }
    // Fallback
    return result.toString();
  }

  /// Convert an OpenIM JS Promise to a Dart Future
  static Future<dynamic> callPromise(JSAny jsPromise) async {
    try {
      if (jsPromise.isUndefined || jsPromise.isNull) {
        return null;
      }
      // Try to await it as a Promise
      final promise = jsPromise as JSPromise;
      final result = await promise.toDart;
      return js2dartString(result);
    } catch (e) {
      if (e is JSObject) {
        int errCode = -1;
        String errMsg = 'Unknown JS Promise Rejection';
        
        try {
          final errCodeProp = e.getProperty('errCode'.toJS);
          if (errCodeProp != null && !errCodeProp.isUndefined) {
            errCode = (errCodeProp as JSNumber).toDartInt;
          }
          final errMsgProp = e.getProperty('errMsg'.toJS);
          if (errMsgProp != null && !errMsgProp.isUndefined) {
            errMsg = (errMsgProp as JSString).toDart;
          }
        } catch (_) {}
        
        throw OpenIMError(errCode, errMsg, methodName: 'callPromise');
      }
      throw OpenIMError(-1, e.toString(), methodName: 'callPromise');
    }
  }



  /// 事件触发
  static void _onEvent(Function(OpenIMListener) callback) {
    for (OpenIMListener listener in OpenIMManager.listeners) {
      if (!_listeners.contains(listener)) return;
      callback(listener);
    }
  }

  static final ObserverList<OpenIMListener> _listeners = ObserverList<OpenIMListener>();
  static List<OpenIMListener> get listeners {
    return List<OpenIMListener>.from(_listeners);
  }

  static bool get hasListeners => _listeners.isNotEmpty;

  static void addListener(OpenIMListener listener) {
    _listeners.add(listener);
  }

  static void removeListener(OpenIMListener listener) {
    _listeners.remove(listener);
  }

  /// Safely convert a callPromise result to String.
  /// Handles JSArray, List, Map, and other non-String JS types.
  static String ensureResultString(dynamic result) {
    if (result is String) return result;
    if (result == null) return '';
    // Check JSAny FIRST — JSArray/JSObject bypass Dart's 'is List'/'is Map'
    if (result is JSAny) {
      return js2dartString(result) ?? '';
    }
    if (result is List || result is Map || result is num || result is bool) {
      return jsonEncode(result);
    }
    return result.toString();
  }

  static String get operationID => DateTime.now().millisecondsSinceEpoch.toString();
}
