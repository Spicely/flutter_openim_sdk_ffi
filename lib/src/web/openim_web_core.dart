part of '../../openim_web_impl.dart';

const String _libName = 'flutter_openim_sdk_ffi';

/// Web implementation of the OpenIM entry point.
/// Mirrors the native [OpenIM] class.
class OpenIM {
  static Future<String> version() async {
    // WASM doesn't expose a version function; return a placeholder
    return 'web-wasm';
  }

  static final iMManager = IMManager();

  OpenIM._();
}
