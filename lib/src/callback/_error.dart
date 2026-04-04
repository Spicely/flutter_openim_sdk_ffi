part of '../../flutter_openim_sdk_ffi_native.dart';

void _error(_PortModel msg) {
  if (msg.operationID != null) {
    OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(
      error: msg.data,
      errCode: msg.errCode,
      callMethodName: msg.callMethodName,
    ));
    OpenIMManager._sendPortMap.remove(msg.operationID!);
  }
}
