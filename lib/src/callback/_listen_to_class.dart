part of '../../flutter_openim_sdk_ffi.dart';

void _listenToClass(_PortModel data, _IsolateTaskData<_InitSdkParams?> task) {
  switch (data.method) {
    case 'OnError':
      _error(data);
      break;
    case 'OnSuccess':
      _success(data);
      break;
    case ListenerType.onConversationChanged:
    case ListenerType.onNewConversation:
      data.data = IMUtils.toList(data.data, (map) => ConversationInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onRecvNewMessage:
    case ListenerType.onRecvOfflineNewMessage:
    case ListenerType.onRecvOnlineOnlyMessage:
      data.data = IMUtils.toObj(data.data, (map) => Message.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onSelfInfoUpdated:
      data.data = IMUtils.toObj(data.data, (map) => UserInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onGroupApplicationAccepted:
    case ListenerType.onGroupApplicationAdded:
    case ListenerType.onGroupApplicationRejected:
      data.data = IMUtils.toObj(data.data, (map) => GroupApplicationInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onGroupInfoChanged:
    case ListenerType.onJoinedGroupAdded:
    case ListenerType.onJoinedGroupDeleted:
    case ListenerType.onGroupDismissed:
      data.data = IMUtils.toObj(data.data, (map) => GroupInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onGroupMemberAdded:
    case ListenerType.onGroupMemberDeleted:
    case ListenerType.onGroupMemberInfoChanged:
      data.data = IMUtils.toObj(data.data, (map) => GroupMembersInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onBlackAdded:
    case ListenerType.onBlackDeleted:
      data.data = IMUtils.toObj(data.data, (map) => BlacklistInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onFriendAdded:
    case ListenerType.onFriendDeleted:
    case ListenerType.onFriendInfoChanged:
      data.data = IMUtils.toObj(data.data, (map) => FriendInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onFriendApplicationAccepted:
    case ListenerType.onFriendApplicationAdded:
    case ListenerType.onFriendApplicationDeleted:
    case ListenerType.onFriendApplicationRejected:
      data.data = IMUtils.toObj(data.data, (map) => FriendApplicationInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onRecvMessageExtensionsDeleted:
      data.data = IMUtils.toList(data.data, (map) => map);
      task.sendPort.send(data);
      break;
    case ListenerType.onRecvC2CReadReceipt:
    case ListenerType.onRecvGroupReadReceipt:
      data.data = IMUtils.toList(data.data, (map) => ReadReceiptInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onNewRecvMessageRevoked:
      data.data = IMUtils.toObj(data.data, (map) => RevokedInfo.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.onConversationUserInputStatusChanged:
      data.data = IMUtils.toObj(data.data, (map) => InputStatusChangedData.fromJson(map));
      task.sendPort.send(data);
      break;
    case ListenerType.open:
    case ListenerType.partSize:
    case ListenerType.hashPartProgress:
    case ListenerType.hashPartComplete:
    case ListenerType.uploadPartComplete:
    case ListenerType.uploadComplete:
    case ListenerType.complete:
      data.data = jsonDecode(data.data);
      task.sendPort.send(data);
      break;
    default:
      task.sendPort.send(data);
  }
}
