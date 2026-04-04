part of '../flutter_openim_sdk_ffi_native.dart';

class OpenIMManager {
  static late final _IMManager _imManager;

  /// 通信存储
  static final Map<String, SendPort> _sendPortMap = {};

  /// 获取线程里的通信端口
  static SendPort get _sendPort => _imManager.isolatePort;

  static IMPlatform getIMPlatform() {
    if (kIsWeb) {
      return IMPlatform.web;
    }
    if (Platform.isAndroid) {
      return IMPlatform.android;
    }
    if (Platform.isIOS) {
      return IMPlatform.ios;
    }
    if (Platform.isWindows) {
      return IMPlatform.windows;
    }
    if (Platform.isMacOS) {
      return IMPlatform.xos;
    }
    if (Platform.isLinux) {
      return IMPlatform.linux;
    }
    return IMPlatform.ipad;
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
    ReceivePort port = ReceivePort();
    RootIsolateToken? rootIsolateToken = RootIsolateToken.instance;
    _InitSdkParams params = _InitSdkParams(
      apiAddr: apiAddr,
      wsAddr: wsAddr,
      dataDir: dataDir,
      logLevel: logLevel,
      operationID: operationID,
      isLogStandardOutput: isLogStandardOutput,
      logFilePath: logFilePath,
      isExternalExtensions: isExternalExtensions,
    );
    Isolate isolate = await Isolate.spawn(
      _isolateEntry,
      _IsolateTaskData<_InitSdkParams?>(port.sendPort, params, rootIsolateToken),
      errorsAreFatal: false,
    );

    final completer = Completer();
    port.listen((msg) {
      if (msg is _PortModel) {
        _methodChannel(msg, completer);
        return;
      }
      if (msg is SendPort) {
        _imManager = _IMManager(receivePort: port, isolate: isolate, isolatePort: msg);
        return;
      }
    });

    return await completer.future;
  }

  static void _methodChannel(_PortModel port, Completer completer) {
    switch (port.method) {
      case _PortMethod.initSDK:
        completer.complete(port.data);
        break;
      default:
        _listen(port);
    }
  }

  static Future<void> _isolateEntry(_IsolateTaskData<_InitSdkParams?> task) async {
    if (task.rootIsolateToken != null) {
      BackgroundIsolateBinaryMessenger.ensureInitialized(task.rootIsolateToken!);
    }
    final ffi.DynamicLibrary dylib = () {
      if (Platform.isMacOS || Platform.isIOS) {
        return ffi.DynamicLibrary.open('$_libName.framework/$_libName');
      }
      if (Platform.isAndroid || Platform.isLinux) {
        return ffi.DynamicLibrary.open('lib$_libName.so');
      }
      if (Platform.isWindows) {
        return ffi.DynamicLibrary.open('$_libName.dll');
      }
      throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
    }();
    FlutterOpenimSdkFfiBindings bindings = FlutterOpenimSdkFfiBindings(dylib);

    try {
      final receivePort = ReceivePort();
      task.sendPort.send(receivePort.sendPort);
      bindings.Dart_InitializeApiDL(ffi.NativeApi.initializeApiDLData);

      bool status = true;
      if (task.data != null) {
        _InitSdkParams data = task.data!;
        String? dataDir = data.dataDir;
        if (dataDir == null) {
          Directory document = await getApplicationDocumentsDirectory();
          dataDir = document.path;
        }
        String config = jsonEncode({
          'platformID': getIMPlatform().rawValue,
          'apiAddr': data.apiAddr,
          'wsAddr': data.wsAddr,
          'dataDir': dataDir,
          'logLevel': data.logLevel,
          'LogFilePath': data.logFilePath,
          'isLogStandardOutput': data.isLogStandardOutput,
          'isExternalExtensions': data.isExternalExtensions,
        });
        final listenerPtr = bindings.getIMListener();

        /// 临时解决方案
        if (Platform.isWindows) {
          bindings = FlutterOpenimSdkFfiBindings(ffi.DynamicLibrary.open('libopenim_sdk_ffi.dll'));
        } else if (Platform.isIOS) {
          bindings = FlutterOpenimSdkFfiBindings(ffi.DynamicLibrary.open('openim_sdk_ffi.framework/openim_sdk_ffi'));
        }
        final operationID0 = IMUtils.checkOperationID(data.operationID).toNativeUtf8().cast<ffi.Char>();
        final config0 = config.toNativeUtf8().cast<ffi.Char>();
        status = bindings.InitSDK(listenerPtr, receivePort.sendPort.nativePort, operationID0, config0);
        calloc.free(operationID0);
        calloc.free(config0);
      }
      task.sendPort.send(_PortModel(method: _PortMethod.initSDK, data: status));

      receivePort.listen((msg) {
        try {
          if (msg is String) {
            _PortModel data = _PortModel.fromJson(jsonDecode(msg));
            _listenToClass(data, task);
            return;
          }
          if (msg is _PortModel) {
            _PortModel v = msg;
            try {
              _method(msg, bindings);
            } catch (e) {
              v.sendPort?.send(_PortResult(errCode: 401, error: e.toString(), callMethodName: v.method));
            }
          }
        } catch (e) {
          debugPrint(msg is _PortModel ? msg.method : msg);
          debugPrint(e.toString());
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// 事件触发
  static void _onEvent(Function(OpenIMListener) callback) {
    for (OpenIMListener listener in OpenIMManager.listeners) {
      if (!_listeners.contains(listener)) {
        return;
      }
      callback(listener);
    }
  }

  static final ObserverList<OpenIMListener> _listeners = ObserverList<OpenIMListener>();
  static List<OpenIMListener> get listeners {
    final List<OpenIMListener> localListeners = List<OpenIMListener>.from(_listeners);
    return localListeners;
  }

  static bool get hasListeners {
    return _listeners.isNotEmpty;
  }

  static void addListener(OpenIMListener listener) {
    _listeners.add(listener);
  }

  static void removeListener(OpenIMListener listener) {
    _listeners.remove(listener);
  }

  static String get operationID => DateTime.now().millisecondsSinceEpoch.toString();
}
