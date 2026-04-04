part of '../../flutter_openim_sdk_ffi_native.dart';

class UserManager {
  /// 获取用户资料
  /// [userIDList] 用户ID列表
  Future<List<PublicUserInfo>> getUsersInfo({required List<String> userIDList, String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getUsersInfo,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'userIDList': userIDList,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 获取当前登录用户的信息
  Future<UserInfo> getSelfUserInfo({String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getSelfUserInfo,
      data: {'operationID': IMUtils.checkOperationID(operationID)},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 修改当前登录用户资料
  /// [nickname] 昵称
  ///
  /// [faceURL] 头像
  ///
  /// [globalRecvMsgOpt] 全局消息接收选项
  ///
  /// [ex] 扩展字段
  ///
  Future<String?> setSelfInfo({String? nickname, String? faceURL, int? globalRecvMsgOpt, String? ex, String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setSelfInfo,
      data: {
        'nickname': nickname,
        'faceURL': faceURL,
        'globalRecvMsgOpt': globalRecvMsgOpt,
        'ex': ex,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  Future<List<UserStatusInfo>> subscribeUsersStatus(List<String> userIDs, {String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.subscribeUsersStatus,
      data: {
        'userIDs': userIDs,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  Future unsubscribeUsersStatus(List<String> userIDs, {String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.unsubscribeUsersStatus,
      data: {
        'userIDs': userIDs,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  Future<List<UserStatusInfo>> getSubscribeUsersStatus({String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getSubscribeUsersStatus,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  Future<List<UserStatusInfo>> getUserStatus(List<String> userIDs, {String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getUserStatus,
      data: {
        'userIDs': userIDs,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }
}
