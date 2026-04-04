part of '../../openim_web_impl.dart';

/// Web-specific success handler for WASM callback responses.
void _successWeb(_PortModel msg) {
  if (msg.operationID != null && OpenIMManager._pendingOps.containsKey(msg.operationID)) {
    final completer = OpenIMManager._pendingOps.remove(msg.operationID!)!;

    // Deserialize data based on the callMethodName
    dynamic parsedData = msg.data;

    switch (msg.callMethodName) {
      case _PortMethod.getAllConversationList:
      case _PortMethod.getMultipleConversation:
      case _PortMethod.getConversationListSplit:
        parsedData = IMUtils.toList(msg.data, (v) => ConversationInfo.fromJson(v));
        break;
      case _PortMethod.getOneConversation:
        parsedData = IMUtils.toObj(msg.data, (v) => ConversationInfo.fromJson(v));
        break;
      case _PortMethod.searchLocalMessages:
      case _PortMethod.findMessageList:
        parsedData = IMUtils.toObj(msg.data, (v) => SearchResult.fromJson(v));
        break;
      case _PortMethod.getAdvancedHistoryMessageList:
      case _PortMethod.getAdvancedHistoryMessageListReverse:
        parsedData = IMUtils.toObj(msg.data, (v) => AdvancedMessage.fromJson(v));
        break;
      case _PortMethod.getUsersInfo:
        parsedData = IMUtils.toList(msg.data, (v) => PublicUserInfo.fromJson(v));
        break;
      case _PortMethod.getSelfUserInfo:
        parsedData = IMUtils.toObj(msg.data, (v) => UserInfo.fromJson(v));
        break;
      case _PortMethod.sendMessage:
      case _PortMethod.sendMessageNotOss:
      case _PortMethod.insertSingleMessageToLocalStorage:
      case _PortMethod.insertGroupMessageToLocalStorage:
        parsedData = IMUtils.toObj(msg.data, (v) => Message.fromJson(v));
        break;
      case _PortMethod.inviteUserToGroup:
      case _PortMethod.kickGroupMember:
        parsedData = IMUtils.toList(
            msg.data == '""' ? '[]' : msg.data, (v) => GroupInviteResult.fromJson(v));
        break;
      case _PortMethod.getGroupMembersInfo:
      case _PortMethod.getGroupMemberList:
      case _PortMethod.getGroupMemberListByJoinTimeFilter:
      case _PortMethod.getGroupMemberOwnerAndAdmin:
      case _PortMethod.searchGroupMembers:
        parsedData = IMUtils.toList(msg.data, (v) => GroupMembersInfo.fromJson(v));
        break;
      case _PortMethod.getSubscribeUsersStatus:
      case _PortMethod.subscribeUsersStatus:
        parsedData = IMUtils.toList(msg.data, (v) => UserStatusInfo.fromJson(v));
        break;
      case _PortMethod.getJoinedGroupList:
      case _PortMethod.getGroupsInfo:
      case _PortMethod.searchGroups:
        parsedData = IMUtils.toList(msg.data, (v) => GroupInfo.fromJson(v));
        break;
      case _PortMethod.createGroup:
        parsedData = IMUtils.toObj(msg.data, (v) => GroupInfo.fromJson(v));
        break;
      case _PortMethod.getGroupApplicationListAsRecipient:
      case _PortMethod.getGroupApplicationListAsApplicant:
        parsedData = IMUtils.toList(msg.data, (v) => GroupApplicationInfo.fromJson(v));
        break;
      case _PortMethod.getBlackList:
        parsedData = IMUtils.toList(msg.data, (v) => BlacklistInfo.fromJson(v));
        break;
      case _PortMethod.getInputStates:
        if (msg.data is String) {
          parsedData = jsonDecode(msg.data);
        } else if (msg.data is List) {
          parsedData = msg.data;
        }
        break;
      case _PortMethod.getFriendsInfo:
      case _PortMethod.getFriendList:
      case _PortMethod.getFriendListPage:
        parsedData = IMUtils.toList(msg.data, (v) => FriendInfo.fromJson(v));
        break;
      case _PortMethod.getFriendApplicationListAsApplicant:
      case _PortMethod.getFriendApplicationListAsRecipient:
        parsedData = IMUtils.toList(msg.data, (v) => FriendApplicationInfo.fromJson(v));
        break;
      case _PortMethod.searchFriends:
        parsedData = IMUtils.toList(msg.data, (v) => SearchFriendsInfo.fromJson(v));
        break;
      case _PortMethod.checkFriend:
        parsedData = IMUtils.toList(msg.data, (v) => FriendshipInfo.fromJson(v));
        break;
      case _PortMethod.getConversationIDBySessionType:
      case _PortMethod.getTotalUnreadMsgCount:
        if (msg.data is int) {
          parsedData = msg.data;
        } else if (msg.data is String) {
          parsedData = int.tryParse(msg.data) ?? 0;
        }
        break;
    }

    completer.complete(_PortResult(data: parsedData));
  }
}
