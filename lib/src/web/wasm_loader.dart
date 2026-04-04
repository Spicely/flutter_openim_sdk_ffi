import 'dart:async';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

/// Loads the OpenIM WASM engine if not already initialized.
///
/// This function:
/// 1. Checks if the WASM is already loaded (by checking for a global `initSDK` function)
/// 2. If not, dynamically injects `wasm_exec.js` and instantiates `openIM.wasm`
/// 3. Waits until the global functions are registered by the Go runtime
Future<void> loadOpenIMWasm({String? wasmPath, String? wasmExecPath}) async {
  // Check if already loaded by index.html
  if (_isWasmReady()) {
    debugPrint('[OpenIM] WASM already loaded, skipping dynamic load.');
    return;
  }

  debugPrint('[OpenIM] WASM not yet ready, waiting for it to initialize...');

  // The user likely loads WASM in index.html, but it may not have finished yet.
  // Wait for the Go runtime to register global functions.
  try {
    await _waitForReady(timeout: const Duration(seconds: 15));
    debugPrint('[OpenIM] WASM ready after waiting.');
    return;
  } catch (_) {
    debugPrint('[OpenIM] WASM not loaded by index.html, attempting dynamic load...');
  }

  // Fallback: try to load dynamically
  final String assetBase = 'assets/packages/flutter_openim_sdk_ffi/lib/assets/web';
  final String execPath = wasmExecPath ?? '$assetBase/wasm_exec.js';
  final String binaryPath = wasmPath ?? '$assetBase/openIM.wasm';

  // Step 1: Inject the DB bridge module
  await _loadScript('$assetBase/openim_db_init.js', isModule: true);

  // Wait a moment for the DB bridge script to start execution and set window.initDB
  await _waitForDbBridge();

  // Step 2: Load wasm_exec.js if not already present
  if (!_isGoRuntimeLoaded()) {
    await _loadScript(execPath);
  }

  // Step 3: Instantiate and run the WASM module
  await _instantiateWasm(binaryPath);

  // Step 4: Wait for global functions to be registered
  await _waitForReady();
}

/// Check if `initSDK` is available on the global scope
bool _isWasmReady() {
  try {
    final val = globalContext.getProperty('initSDK'.toJS);
    return val != null && !val.isUndefined;
  } catch (_) {
    return false;
  }
}

/// Check if Go's wasm_exec runtime is loaded
bool _isGoRuntimeLoaded() {
  try {
    final val = globalContext.getProperty('Go'.toJS);
    return val != null && !val.isUndefined;
  } catch (_) {
    return false;
  }
}

/// Dynamically inject a <script> tag and wait for it to load
Future<void> _loadScript(String src, {bool isModule = false}) {
  final completer = Completer<void>();
  final script = web.document.createElement('script') as web.HTMLScriptElement;
  script.src = src;
  script.type = isModule ? 'module' : 'text/javascript';

  script.onload = ((web.Event _) {
    completer.complete();
  }).toJS;

  script.onerror = ((web.Event _) {
    completer.completeError(Exception('Failed to load script: $src'));
  }).toJS;

  web.document.head?.appendChild(script);
  return completer.future;
}

/// Wait for openim_db_init.js to inject window.initDB
Future<void> _waitForDbBridge() async {
  int attempts = 0;
  while (!globalContext.hasProperty('initDB'.toJS).isDefinedAndNotNull) {
    if (attempts > 100) {
      print('[OpenIM] DB bridge not ready after timeout, proceeding anyway');
      return;
    }
    attempts++;
    await Future.delayed(const Duration(milliseconds: 100));
  }
}

/// Create a Go() instance, fetch and instantiate the WASM, then run it
Future<void> _instantiateWasm(String wasmPath) async {
  // const go = new Go();
  final goConstructor = globalContext.getProperty('Go'.toJS) as JSFunction;
  final go = goConstructor.callAsConstructor<JSObject>();

  // The importObject is a property on the Go instance
  final importObject = go.getProperty('importObject'.toJS) as JSObject;

  // Use WebAssembly.instantiateStreaming for efficient loading
  final wasmModule = await _instantiateStreaming(wasmPath, importObject);

  // go.run(result.instance)  — this starts the Go main() which registers global functions
  final instance = (wasmModule as JSObject).getProperty('instance'.toJS);
  go.callMethod('run'.toJS, instance);
}

/// Call WebAssembly.instantiateStreaming
Future<JSAny> _instantiateStreaming(String url, JSObject importObject) {
  final completer = Completer<JSAny>();

  final wasmNamespace = globalContext.getProperty('WebAssembly'.toJS) as JSObject;
  final fetchResult = globalContext.callMethod('fetch'.toJS, url.toJS);

  final promise = wasmNamespace.callMethod(
    'instantiateStreaming'.toJS,
    fetchResult,
    importObject,
  ) as JSPromise;

  promise.toDart.then((result) {
    completer.complete(result);
  }).catchError((error) {
    completer.completeError(Exception('Failed to instantiate WASM: $error'));
  });

  return completer.future;
}

/// Poll until the WASM runtime has registered its functions
Future<void> _waitForReady({Duration timeout = const Duration(seconds: 10)}) async {
  final deadline = DateTime.now().add(timeout);
  while (!_isWasmReady()) {
    if (DateTime.now().isAfter(deadline)) {
      throw TimeoutException('OpenIM WASM engine did not initialize within $timeout');
    }
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
