part of '../../flutter_openim_sdk_ffi_native.dart';

void _success(_PortModel msg) {
  switch (msg.callMethodName) {
    case _PortMethod.getAllConversationList:
    case _PortMethod.getMultipleConversation:
    case _PortMethod.getConversationListSplit:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => ConversationInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.searchLocalMessages:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toObj(msg.data, (v) => SearchResult.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;

    case _PortMethod.getAdvancedHistoryMessageList:
    case _PortMethod.getAdvancedHistoryMessageListReverse:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toObj(msg.data, (v) => AdvancedMessage.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getOneConversation:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toObj(msg.data, (v) => ConversationInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.findMessageList:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toObj(msg.data, (v) => SearchResult.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getUsersInfo:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => PublicUserInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getSelfUserInfo:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toObj(msg.data, (v) => UserInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.sendMessage:
    case _PortMethod.sendMessageNotOss:
    case _PortMethod.insertSingleMessageToLocalStorage:
    case _PortMethod.insertGroupMessageToLocalStorage:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toObj(msg.data, (v) => Message.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.inviteUserToGroup:
    case _PortMethod.kickGroupMember:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data == '""' ? '[]' : msg.data, (v) => GroupInviteResult.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getGroupMembersInfo:
    case _PortMethod.getGroupMemberList:
    case _PortMethod.getGroupMemberListByJoinTimeFilter:
    case _PortMethod.getGroupMemberOwnerAndAdmin:
    case _PortMethod.searchGroupMembers:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => GroupMembersInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getSubscribeUsersStatus:
    case _PortMethod.subscribeUsersStatus:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => UserStatusInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getJoinedGroupList:
    case _PortMethod.getGroupsInfo:
    case _PortMethod.searchGroups:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => GroupInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.createGroup:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toObj(msg.data, (v) => GroupInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getGroupApplicationListAsRecipient:
    case _PortMethod.getGroupApplicationListAsApplicant:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => GroupApplicationInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getConversationIDBySessionType:
    case _PortMethod.getTotalUnreadMsgCount:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: int.parse(msg.data)));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.uploadFile:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: msg.data));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getBlackList:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => BlacklistInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getInputStates:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: jsonDecode(msg.data)));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getFriendsInfo:
    case _PortMethod.getFriendList:
    case _PortMethod.getFriendListPage:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => FriendInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.getFriendApplicationListAsApplicant:
    case _PortMethod.getFriendApplicationListAsRecipient:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => FriendApplicationInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.searchFriends:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => SearchFriendsInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    case _PortMethod.checkFriend:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: IMUtils.toList(msg.data, (v) => FriendshipInfo.fromJson(v))));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
      break;
    default:
      if (msg.operationID != null) {
        OpenIMManager._sendPortMap[msg.operationID!]?.send(_PortResult(data: msg.data));
        OpenIMManager._sendPortMap.remove(msg.operationID!);
      }
  }
}
