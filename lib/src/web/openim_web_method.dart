part of '../../openim_web_impl.dart';

/// Web-specific error handler for WASM callback responses.
void _errorWeb(_PortModel msg) {
  if (msg.operationID != null && OpenIMManager._pendingOps.containsKey(msg.operationID)) {
    final completer = OpenIMManager._pendingOps.remove(msg.operationID!)!;
    completer.complete(_PortResult(
      error: msg.data is String ? msg.data : jsonEncode(msg.data),
      errCode: msg.errCode is int ? msg.errCode : int.tryParse(msg.errCode?.toString() ?? ''),
      callMethodName: msg.callMethodName,
    ));
  }
}
