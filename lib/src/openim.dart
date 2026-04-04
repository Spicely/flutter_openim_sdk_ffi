part of '../flutter_openim_sdk_ffi_native.dart';

const String _libName = 'flutter_openim_sdk_ffi';

class OpenIM {
  static Future<String> version() async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(method: _PortMethod.version, sendPort: receivePort.sendPort));
    _PortResult<String> data = await receivePort.first;
    receivePort.close();
    return data.value;
  }

  static final iMManager = IMManager();

  OpenIM._();
}
