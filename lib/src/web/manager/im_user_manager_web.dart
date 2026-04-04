part of '../../../openim_web_impl.dart';

/// Web implementation of UserManager.
class UserManager {
  Future<UserInfo> getSelfUserInfo({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetSelfUserInfo(opID.toJS));
    if (result == null) return null as dynamic;
    return UserInfo.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<void> setSelfInfo({
    String? nickname,
    String? faceURL,
    int? appMangerLevel,
    int? globalRecvMsgOpt,
    String? ex,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final info = <String, dynamic>{};
    if (nickname != null) info['nickname'] = nickname;
    if (faceURL != null) info['faceURL'] = faceURL;
    if (appMangerLevel != null) info['appMangerLevel'] = appMangerLevel;
    if (globalRecvMsgOpt != null) info['globalRecvMsgOpt'] = globalRecvMsgOpt;
    if (ex != null) info['ex'] = ex;
    final result = await OpenIMManager.callPromise(jsSetSelfInfo(opID.toJS, jsonEncode(info).toJS));
  }

  Future<List<PublicUserInfo>> getUsersInfo({
    required List<String> userIDList,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetUsersInfo(opID.toJS, jsonEncode(userIDList).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => PublicUserInfo.fromJson(e)).toList();
  }

  Future<List<UserStatusInfo>> subscribeUsersStatus({
    required List<String> userIDs,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSubscribeUsersStatus(opID.toJS, jsonEncode(userIDs).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => UserStatusInfo.fromJson(e)).toList();
  }

  Future<void> unsubscribeUsersStatus({
    required List<String> userIDs,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsUnsubscribeUsersStatus(opID.toJS, jsonEncode(userIDs).toJS));
  }

  Future<List<UserStatusInfo>> getSubscribeUsersStatus({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetSubscribeUsersStatus(opID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => UserStatusInfo.fromJson(e)).toList();
  }

  Future<List<UserStatusInfo>> getUserStatus({
    required List<String> userIDs,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetUserStatus(opID.toJS, jsonEncode(userIDs).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => UserStatusInfo.fromJson(e)).toList();
  }
}
