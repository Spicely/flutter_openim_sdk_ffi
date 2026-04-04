/// Platform-agnostic entry point for the OpenIM SDK.
///
/// This file uses Dart's conditional imports to automatically
/// select the correct implementation based on the target platform:
/// - On native platforms (iOS/Android/macOS/Windows/Linux): uses dart:ffi
/// - On web: uses WASM + JS Interop
///
/// ## Usage in consumer apps:
///
/// ```dart
/// import 'package:flutter_openim_sdk_ffi/openim.dart';
///
/// // All APIs are the same regardless of platform
/// await OpenIMManager.init(apiAddr: '...', wsAddr: '...');
/// await OpenIM.iMManager.login(userID: '...', token: '...');
/// ```
library openim;

// Conditional import: selects the correct implementation
export 'flutter_openim_sdk_ffi_native.dart'
    if (dart.library.js_interop) 'openim_web_impl.dart';
