part of '../../flutter_openim_sdk_ffi_native.dart';

class IMManager {
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;
  late UserManager userManager;

  String? uid;

  UserInfo? uInfo;

  bool isLogined = false;
  String? token;

  IMManager() {
    conversationManager = ConversationManager();
    friendshipManager = FriendshipManager();
    messageManager = MessageManager();
    groupManager = GroupManager();
    userManager = UserManager();
  }

  /// 反初始化SDK
  // Future<void> unInitSDK() async {
  //   ReceivePort receivePort = ReceivePort();

  //   OpenIMManager._sendPort.send(_PortModel(
  //     method: _PortMethod.unInitSDK,
  //     sendPort: receivePort.sendPort,
  //   ));
  //   _PortResult result = await receivePort.first;
  //   if (result.error != null) {
  //     throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
  //   }
  //   receivePort.close();
  // }

  /// 登录
  /// [userID] 用户id
  /// [token] 登录token，从业务服务器上获取
  /// [defaultValue] 获取失败后使用的默认值
  Future<UserInfo> login({
    required String userID,
    required String token,
    String? operationID,
    Future<UserInfo> Function()? defaultValue,
  }) async {
    isLogined = true;
    uid = userID;
    this.token = token;
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.login,
      data: {'operationID': IMUtils.checkOperationID(operationID), 'userID': userID, 'token': token},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.errCode != null && result.errCode != 10102) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }

    try {
      return uInfo = await userManager.getSelfUserInfo();
    } catch (error, stackTrace) {
      log('login e: $error  s: $stackTrace');
      if (null != defaultValue) {
        return uInfo = await (defaultValue.call());
      }
      return Future.error(error, stackTrace);
    }
  }

  /// 登出
  Future<void> logout({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.logout,
      data: {'operationID': IMUtils.checkOperationID(operationID)},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 获取登录状态
  Future<int?> getLoginStatus({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getLoginStatus,
      data: {'operationID': IMUtils.checkOperationID(operationID)},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 获取当前登录用户id
  Future<String> getLoginUserID() async {
    if (uid == null) {
      UserInfo info = await OpenIM.iMManager.userManager.getSelfUserInfo();
      uInfo = info;
      uid = info.userID;
      return uid!;
    } else {
      return uid!;
    }
  }

  /// 获取当前登录用户信息
  Future<UserInfo> getLoginUserInfo() async {
    if (uInfo == null) {
      UserInfo info = await OpenIM.iMManager.userManager.getSelfUserInfo();
      uInfo = info;
      uid = info.userID;
      return info;
    } else {
      return uInfo!;
    }
  }

  /// 从后台回到前台立刻唤醒
  Future wakeUp({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.wakeUp,
      data: {'operationID': IMUtils.checkOperationID(operationID)},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 上传文件到服务器
  ///
  ///[putID] 区分是哪个文件的回调
  Future<void> uploadFile({
    required String putID,
    required String filePath,
    required String fileName,
    String? contentType,
    String? cause,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.uploadFile,
      data: {
        'filePath': filePath,
        'name': fileName,
        'contentType': contentType ?? '',
        'cause': cause,
        'operationID': IMUtils.checkOperationID(operationID),
        'uuid': putID,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 更新firebase客户端注册token
  ///
  /// [fcmToken] FCM Token
  ///
  /// [expireTime] FCM Token 过期时间，单位秒
  Future<void> updateFcmToken({
    required String fcmToken,
    String? operationID,
    required int expireTime,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.updateFcmToken,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'fcmToken': fcmToken,
        'expireTime': expireTime,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 标记app处于后台
  Future<void> setAppBackgroundStatus({
    required bool isBackground,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setAppBackgroundStatus,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'isBackground': isBackground,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 网络改变
  Future<void> networkChanged({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.networkStatusChanged,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 设置角标
  Future<void> setAppBadge(
    int unreadCount, {
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setAppBadge,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'unreadCount': unreadCount,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }
}
