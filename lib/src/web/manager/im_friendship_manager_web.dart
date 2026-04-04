part of '../../../openim_web_impl.dart';

/// Web implementation of FriendshipManager.
class FriendshipManager {
  Future<List<FriendInfo>> getFriendList({bool filterBlack = false, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetFriendList(opID.toJS, filterBlack.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => FriendInfo.fromJson(e)).toList();
  }

  Future<List<FriendInfo>> getFriendListPage({
    int offset = 0,
    int count = 40,
    bool filterBlack = false,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetFriendListPage(opID.toJS, offset.toJS, count.toJS, filterBlack.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => FriendInfo.fromJson(e)).toList();
  }

  Future<List<FriendInfo>> getFriendsInfo({
    required List<String> userIDList,
    bool filterBlack = false,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetSpecifiedFriendsInfo(opID.toJS, jsonEncode(userIDList).toJS, filterBlack.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => FriendInfo.fromJson(e)).toList();
  }

  Future<void> addFriend({
    required String userID,
    String? reason,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final reqMsg = jsonEncode({'toUserID': userID, 'reqMsg': reason ?? ''});
    final result = await OpenIMManager.callPromise(jsAddFriend(opID.toJS, reqMsg.toJS));
  }

  Future<List<FriendApplicationInfo>> getFriendApplicationListAsRecipient({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetFriendApplicationListAsRecipient(opID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => FriendApplicationInfo.fromJson(e)).toList();
  }

  Future<List<FriendApplicationInfo>> getFriendApplicationListAsApplicant({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetFriendApplicationListAsApplicant(opID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => FriendApplicationInfo.fromJson(e)).toList();
  }

  Future<void> acceptFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final req = jsonEncode({'toUserID': userID, 'handleMsg': handleMsg ?? ''});
    final result = await OpenIMManager.callPromise(jsAcceptFriendApplication(opID.toJS, req.toJS));
  }

  Future<void> refuseFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final req = jsonEncode({'toUserID': userID, 'handleMsg': handleMsg ?? ''});
    final result = await OpenIMManager.callPromise(jsRefuseFriendApplication(opID.toJS, req.toJS));
  }

  Future<void> deleteFriend({required String userID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDeleteFriend(opID.toJS, userID.toJS));
  }

  Future<List<FriendshipInfo>> checkFriend({required List<String> userIDList, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCheckFriend(opID.toJS, jsonEncode(userIDList).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => FriendshipInfo.fromJson(e)).toList();
  }

  Future<List<SearchFriendsInfo>> searchFriends({
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchNickname = false,
    bool isSearchRemark = false,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final param = jsonEncode({
      'keywordList': keywordList,
      'isSearchUserID': isSearchUserID,
      'isSearchNickname': isSearchNickname,
      'isSearchRemark': isSearchRemark,
    });
    final result = await OpenIMManager.callPromise(jsSearchFriends(opID.toJS, param.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => SearchFriendsInfo.fromJson(e)).toList();
  }

  Future<List<BlacklistInfo>> getBlacklist({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetBlackList(opID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => BlacklistInfo.fromJson(e)).toList();
  }

  Future<void> addBlacklist({required String userID, String? ex, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsAddBlack(opID.toJS, userID.toJS, (ex ?? '').toJS));
  }

  Future<void> removeBlacklist({required String userID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsRemoveBlack(opID.toJS, userID.toJS));
  }

  Future<void> updateFriends({required UpdateFriendsReq req, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsUpdateFriends(opID.toJS, jsonEncode(req.toJson()).toJS));
  }
}
