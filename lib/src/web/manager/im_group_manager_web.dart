part of '../../../openim_web_impl.dart';

/// Web implementation of GroupManager.
class GroupManager {
  Future<GroupInfo> createGroup({
    required GroupInfo groupInfo,
    List<String> memberUserIDs = const [],
    List<String> adminUserIDs = const [],
    String? ownerUserID,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final reqInfo = jsonEncode({
      'groupInfo': groupInfo.toJson(),
      'memberUserIDs': memberUserIDs,
      'adminUserIDs': adminUserIDs,
      'ownerUserID': ownerUserID ?? '',
    });
    final result = await OpenIMManager.callPromise(jsCreateGroup(opID.toJS, reqInfo.toJS));
    if (result == null) return null as dynamic;
    return GroupInfo.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<List<GroupInfo>> getJoinedGroupList({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetJoinedGroupList(opID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupInfo.fromJson(e)).toList();
  }

  Future<List<GroupInfo>> getJoinedGroupListPage({int offset = 0, int count = 40, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetJoinedGroupListPage(opID.toJS, offset.toJS, count.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupInfo.fromJson(e)).toList();
  }

  Future<List<GroupInfo>> getGroupsInfo({required List<String> groupIDList, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetSpecifiedGroupsInfo(opID.toJS, jsonEncode(groupIDList).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupInfo.fromJson(e)).toList();
  }

  Future<void> setGroupInfo({required GroupInfo groupInfo, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSetGroupInfo(opID.toJS, jsonEncode(groupInfo.toJson()).toJS));
  }

  Future<List<GroupInfo>> searchGroups({
    List<String> keywordList = const [],
    bool isSearchGroupID = false,
    bool isSearchGroupName = false,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final param = jsonEncode({
      'keywordList': keywordList,
      'isSearchGroupID': isSearchGroupID,
      'isSearchGroupName': isSearchGroupName,
    });
    final result = await OpenIMManager.callPromise(jsSearchGroups(opID.toJS, param.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupInfo.fromJson(e)).toList();
  }

  Future<List<GroupMembersInfo>> getGroupMemberList({
    required String groupID,
    int filter = 0,
    int offset = 0,
    int count = 0,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetGroupMemberList(opID.toJS, groupID.toJS, filter.toJS, offset.toJS, count.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupMembersInfo.fromJson(e)).toList();
  }

  Future<List<GroupMembersInfo>> getGroupMemberOwnerAndAdmin({required String groupID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetGroupMemberOwnerAndAdmin(opID.toJS, groupID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupMembersInfo.fromJson(e)).toList();
  }

  Future<List<GroupMembersInfo>> getGroupMemberListByJoinTimeFilter({
    required String groupID,
    int offset = 0,
    int count = 0,
    int joinTimeBegin = 0,
    int joinTimeEnd = 0,
    List<String> filterUserIDList = const [],
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetGroupMemberListByJoinTimeFilter(
      opID.toJS, groupID.toJS, offset.toJS, count.toJS,
      joinTimeBegin.toJS, joinTimeEnd.toJS, jsonEncode(filterUserIDList).toJS,
    ));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupMembersInfo.fromJson(e)).toList();
  }

  Future<List<GroupMembersInfo>> getGroupMembersInfo({
    required String groupID,
    required List<String> userIDList,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetSpecifiedGroupMembersInfo(opID.toJS, groupID.toJS, jsonEncode(userIDList).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupMembersInfo.fromJson(e)).toList();
  }

  Future<void> joinGroup({
    required String groupID,
    String? reason,
    int joinSource = 3,
    String? ex,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsJoinGroup(opID.toJS, groupID.toJS, (reason ?? '').toJS, joinSource.toJS, (ex ?? '').toJS));
  }

  Future<void> quitGroup({required String groupID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsQuitGroup(opID.toJS, groupID.toJS));
  }

  Future<void> dismissGroup({required String groupID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDismissGroup(opID.toJS, groupID.toJS));
  }

  Future<void> transferGroupOwner({
    required String groupID,
    required String userID,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsTransferGroupOwner(opID.toJS, groupID.toJS, userID.toJS));
  }

  Future<List<GroupInviteResult>> inviteUserToGroup({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsInviteUserToGroup(opID.toJS, groupID.toJS, (reason ?? '').toJS, jsonEncode(userIDList).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupInviteResult.fromJson(e)).toList();
  }

  Future<List<GroupInviteResult>> kickGroupMember({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsKickGroupMember(opID.toJS, groupID.toJS, (reason ?? '').toJS, jsonEncode(userIDList).toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupInviteResult.fromJson(e)).toList();
  }

  Future<void> changeGroupMute({required String groupID, required bool mute, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsChangeGroupMute(opID.toJS, groupID.toJS, mute.toJS));
  }

  Future<void> changeGroupMemberMute({
    required String groupID,
    required String userID,
    int seconds = 0,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsChangeGroupMemberMute(opID.toJS, groupID.toJS, userID.toJS, seconds.toJS));
  }

  Future<void> setGroupMemberInfo({required SetGroupMemberInfo info, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSetGroupMemberInfo(opID.toJS, jsonEncode(info.toJson()).toJS));
  }

  Future<List<GroupApplicationInfo>> getGroupApplicationListAsRecipient({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetGroupApplicationListAsRecipient(opID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupApplicationInfo.fromJson(e)).toList();
  }

  Future<List<GroupApplicationInfo>> getGroupApplicationListAsApplicant({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetGroupApplicationListAsApplicant(opID.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupApplicationInfo.fromJson(e)).toList();
  }

  Future<void> acceptGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsAcceptGroupApplication(opID.toJS, groupID.toJS, userID.toJS, (handleMsg ?? '').toJS));
  }

  Future<void> refuseGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsRefuseGroupApplication(opID.toJS, groupID.toJS, userID.toJS, (handleMsg ?? '').toJS));
  }

  Future<List<GroupMembersInfo>> searchGroupMembers({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final param = jsonEncode({
      'groupID': groupID,
      'keywordList': keywordList,
      'isSearchUserID': isSearchUserID,
      'isSearchMemberNickname': isSearchMemberNickname,
      'offset': offset,
      'count': count,
    });
    final result = await OpenIMManager.callPromise(jsSearchGroupMembers(opID.toJS, param.toJS));
    if (result == null) return null as dynamic;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).map((e) => GroupMembersInfo.fromJson(e)).toList();
  }

  Future<bool> isJoinGroup({required String groupID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsIsJoinGroup(opID.toJS, groupID.toJS));
    if (result == null) return null as dynamic;
    return result == "true" || result == "True" || result == true;
  }
}
