import 'package:flutter_web_plugins/flutter_web_plugins.dart';

/// Web implementation of the flutter_openim_sdk_ffi plugin.
///
/// This class is registered as the plugin class in pubspec.yaml and
/// serves as the entry point for web platform initialization.
/// The actual web functionality is implemented via WASM + JS Interop
/// in [OpenIMWeb].
class FlutterOpenimSdkFfiWeb {
  static void registerWith(Registrar registrar) {
    // No method channel needed — web uses JS Interop directly.
    // This plugin class is required by Flutter's web plugin registration.
  }
}
