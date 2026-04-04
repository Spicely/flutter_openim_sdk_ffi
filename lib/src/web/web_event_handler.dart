import 'dart:async';
import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'js_bindings.dart';

/// Handles events from the WASM `commonEventFunc` callback,
/// bridging them into a Dart [Stream].
///
/// The WASM side sends events as JSON strings with the format:
/// ```json
/// {
///   "event": "OnRecvNewMessage",
///   "errCode": 0,
///   "errMsg": "",
///   "data": "...",
///   "operationID": "..."
/// }
/// ```
class WebEventHandler {
  static WebEventHandler? _instance;

  final StreamController<Map<String, dynamic>> _eventController =
      StreamController<Map<String, dynamic>>.broadcast();

  /// The broadcast stream of all events from the WASM engine.
  Stream<Map<String, dynamic>> get eventStream => _eventController.stream;

  WebEventHandler._();

  /// Get the singleton instance
  factory WebEventHandler() {
    _instance ??= WebEventHandler._();
    return _instance!;
  }

  bool _registered = false;

  /// Register the JS callback to receive all events from the WASM engine.
  /// Must be called after WASM is loaded and before `initSDK`.
  void registerEventCallback() {
    if (_registered) return;
    _registered = true;

    try {
      jsCommonEventFunc(((JSAny eventJson) {
        String jsonStr = '{}';
        try {
          if (eventJson.typeofEquals('string')) {
            jsonStr = (eventJson as JSString).toDart;
          } else {
            final jsJSON = globalContext.getProperty<JSObject>('JSON'.toJS);
            jsonStr = jsJSON.callMethod<JSString>('stringify'.toJS, eventJson).toDart;
          }
          print('[OpenIM] Received WASM Event: $jsonStr');
          final eventData = jsonDecode(jsonStr);
          if (eventData is Map<String, dynamic>) {
            _eventController.add(eventData);
          } else if (eventData is Map) {
            _eventController.add(Map<String, dynamic>.from(eventData));
          }
        } catch (e, stack) {
          // Log the error so we can see what went wrong
          print('[OpenIM] EVENT HANDLER ERROR: $e\\n$stack\\nRaw JSON: $jsonStr');
        }
      }).toJS);
      print('[OpenIM] jsCommonEventFunc registered successfully');
    } catch (e) {
      print('[OpenIM] jsCommonEventFunc registration failed: $e');
    }
  }

  /// Dispose the event handler
  void dispose() {
    _eventController.close();
    _instance = null;
    _registered = false;
  }
}
