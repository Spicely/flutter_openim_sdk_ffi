/// Platform-agnostic entry point for the OpenIM SDK.
///
/// Uses Dart's conditional imports to automatically select the correct
/// implementation based on the target platform:
/// - On native platforms (iOS/Android/macOS/Windows/Linux): uses dart:ffi
/// - On web: uses WASM + JS Interop
///
/// Consumer apps can simply import this file:
/// ```dart
/// import 'package:flutter_openim_sdk_ffi/flutter_openim_sdk_ffi.dart';
/// ```
library;

export 'flutter_openim_sdk_ffi_native.dart'
    if (dart.library.js_interop) 'openim_web_impl.dart';
