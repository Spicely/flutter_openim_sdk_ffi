part of '../../../openim_web_impl.dart';

/// Web implementation of IMManager.
/// Calls WASM global functions via JS Interop instead of FFI.
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

  /// 登录
  Future<UserInfo> login({
    required String userID,
    required String token,
    String? operationID,
    Future<UserInfo> Function()? defaultValue,
  }) async {
    try {
      isLogined = true;
      uid = userID;
      this.token = token;

      final opID = IMUtils.checkOperationID(operationID);

      // Await the JS promise directly. The Go WASM wrapper returns a Promise via AsyncCallWithCallback
      await OpenIMManager.callPromise(jsLogin(opID.toJS, userID.toJS, token.toJS));

      try {
        return uInfo = await userManager.getSelfUserInfo();
      } catch (error, stackTrace) {
        log('login getSelfUserInfo e: $error  s: $stackTrace');
        if (null != defaultValue) {
          return uInfo = await (defaultValue.call());
        }
        throw error;
      }
    } catch (e) {
      log('login caught error: $e');
      if (e is OpenIMError) {
        rethrow;
      }
      
      // Parse JS error
      String errorMsg = e.toString();
      if (e is JSObject) {
        try {
          final msgProp = e.getProperty('message'.toJS);
          if (msgProp != null && msgProp is JSString) {
            errorMsg = msgProp.toDart;
          } else {
            errorMsg = globalContext.callMethod('String'.toJS, e as JSAny).dartify()?.toString() ?? 'Unknown JS Error';
          }
        } catch (_) {}
      }
      
      throw OpenIMError(-1, 'JS Exception: $errorMsg', methodName: 'login');
    }
  }

  /// 登出
  Future<void> logout({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsLogout(opID.toJS));
  }

  /// 获取登录状态
  Future<int?> getLoginStatus({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    try {
      final result = jsGetLoginStatus(opID.toJS);
      if (result is JSNumber) {
        return (result as JSNumber).toDartInt;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// 获取当前登录用户id
  Future<String> getLoginUserID() async {
    if (uid == null) {
      UserInfo info = await OpenIM.iMManager.userManager.getSelfUserInfo();
      uInfo = info;
      uid = info.userID;
      return uid!;
    }
    return uid!;
  }

  /// 获取当前登录用户信息
  Future<UserInfo> getLoginUserInfo() async {
    if (uInfo == null) {
      UserInfo info = await OpenIM.iMManager.userManager.getSelfUserInfo();
      uInfo = info;
      uid = info.userID;
      return info;
    }
    return uInfo!;
  }

  /// 从后台回到前台立刻唤醒
  Future wakeUp({String? operationID}) async {
    // No-op on web — browser handles its own lifecycle
  }

  /// 上传文件到服务器
  Future<void> uploadFile({
    required String putID,
    required String filePath,
    required String fileName,
    String? contentType,
    String? cause,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final req = jsonEncode({
      'filePath': filePath,
      'name': fileName,
      'contentType': contentType ?? '',
      'cause': cause,
      'operationID': opID,
      'uuid': putID,
    });
    final result = await OpenIMManager.callPromise(jsUploadFile(opID.toJS, req.toJS, putID.toJS));
  }

  /// 更新firebase客户端注册token
  Future<void> updateFcmToken({
    required String fcmToken,
    String? operationID,
    required int expireTime,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsUpdateFcmToken(opID.toJS, fcmToken.toJS, expireTime.toJS));
  }

  /// 标记app处于后台
  Future<void> setAppBackgroundStatus({
    required bool isBackground,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSetAppBackgroundStatus(opID.toJS, isBackground.toJS));
  }

  /// 网络改变
  Future<void> networkChanged({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsNetworkStatusChanged(opID.toJS));
  }

  /// 设置角标 — no-op on web
  Future<void> setAppBadge(int unreadCount, {String? operationID}) async {
    // Not supported on web
  }
}
