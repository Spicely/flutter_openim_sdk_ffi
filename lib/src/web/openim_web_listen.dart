part of '../../openim_web_impl.dart';

/// Web-specific event listener dispatching.
/// Converts WASM EventData events into OpenIMListener callbacks.
void _listenWeb(_PortModel channel) {
  // First check for success/error responses
  if (channel.method == 'OnSuccess') {
    _successWeb(channel);
    return;
  }
  if (channel.method == 'OnError') {
    _errorWeb(channel);
    return;
  }

  // Deserialize data where needed, then dispatch
  switch (channel.method) {
    /// OnConnListener
    case ListenerType.onConnecting:
      OpenIMManager._onEvent((l) => l.onConnecting());
      break;
    case ListenerType.onConnectSuccess:
      OpenIMManager._onEvent((l) => l.onConnectSuccess());
      break;
    case ListenerType.onConnectFailed:
      OpenIMManager._onEvent((l) => l.onConnectFailed(channel.errCode ?? 0, channel.data ?? ''));
      break;
    case ListenerType.onKickedOffline:
      OpenIMManager._onEvent((l) => l.onKickedOffline());
      break;
    case ListenerType.onUserTokenExpired:
      OpenIMManager._onEvent((l) => l.onUserTokenExpired());
      break;
    case ListenerType.onUserTokenInvalid:
      OpenIMManager._onEvent((l) => l.onUserTokenInvalid(channel.data ?? ''));
      break;

    /// Sync
    case ListenerType.onSyncServerStart:
      OpenIMManager._onEvent((l) => l.onSyncServerStart(channel.data == true));
      break;
    case ListenerType.onSyncServerProgress:
      final progress = channel.data is int ? channel.data as int : int.tryParse(channel.data?.toString() ?? '0') ?? 0;
      OpenIMManager._onEvent((l) => l.onSyncServerProgress(progress));
      break;
    case ListenerType.onSyncServerFinish:
      OpenIMManager._onEvent((l) => l.onSyncServerFinish(channel.data == true));
      break;
    case ListenerType.onSyncServerFailed:
      OpenIMManager._onEvent((l) => l.onSyncServerFailed(channel.data == true));
      break;

    /// Progress
    case ListenerType.onProgress:
      final data = _parseJson(channel.data);
      if (data != null) {
        OpenIMManager._onEvent((l) => l.onProgress(data['clientMsgID'] as String? ?? '', data['progress'] as int? ?? 0));
      }
      break;

    /// Conversation
    case ListenerType.onNewConversation:
      final list = _parseConversationList(channel.data);
      OpenIMManager._onEvent((l) => l.onNewConversation(list));
      break;
    case ListenerType.onConversationChanged:
      final list = _parseConversationList(channel.data);
      OpenIMManager._onEvent((l) => l.onConversationChanged(list));
      break;
    case ListenerType.onTotalUnreadMessageCountChanged:
      OpenIMManager._onEvent((l) => l.onTotalUnreadMessageCountChanged(channel.errCode ?? 0));
      break;
    case ListenerType.onConversationUserInputStatusChanged:
      final data = _parseJson(channel.data);
      if (data != null) {
        OpenIMManager._onEvent((l) => l.onInputStatusChanged(InputStatusChangedData.fromJson(data)));
      }
      break;

    /// Message
    case ListenerType.onRecvNewMessage:
      final msg = _parseMessage(channel.data);
      if (msg != null) OpenIMManager._onEvent((l) => l.onRecvNewMessage(msg));
      break;
    case ListenerType.onRecvNewMessages:
      final list = IMUtils.toList(channel.data, (map) => Message.fromJson(map));
      for (var msg in list) {
        OpenIMManager._onEvent((l) => l.onRecvNewMessage(msg));
      }
      break;
    case ListenerType.onRecvOfflineNewMessage:
      final msg = _parseMessage(channel.data);
      if (msg != null) OpenIMManager._onEvent((l) => l.onRecvOfflineNewMessage(msg));
      break;
    case ListenerType.onRecvOfflineNewMessages:
      final list = IMUtils.toList(channel.data, (map) => Message.fromJson(map));
      for (var msg in list) {
        OpenIMManager._onEvent((l) => l.onRecvOfflineNewMessage(msg));
      }
      break;
    case ListenerType.onNewRecvMessageRevoked:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onNewRecvMessageRevoked(RevokedInfo.fromJson(data)));
      break;
    case ListenerType.onRecvC2CReadReceipt:
      OpenIMManager._onEvent((l) => l.onRecvC2CReadReceipt(
          IMUtils.toList(channel.data, (map) => ReadReceiptInfo.fromJson(map))));
      break;
    case ListenerType.onRecvGroupReadReceipt:
      OpenIMManager._onEvent((l) => l.onRecvGroupReadReceipt(
          IMUtils.toList(channel.data, (map) => ReadReceiptInfo.fromJson(map))));
      break;

    /// User
    case ListenerType.onSelfInfoUpdated:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onSelfInfoUpdated(UserInfo.fromJson(data)));
      break;
    case ListenerType.onUserStatusChanged:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onUserStatusChanged(UserStatusInfo.fromJson(data)));
      break;

    /// Group
    case ListenerType.onGroupDismissed:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupDismissed(GroupInfo.fromJson(data)));
      break;
    case ListenerType.onGroupInfoChanged:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupInfoChanged(GroupInfo.fromJson(data)));
      break;
    case ListenerType.onJoinedGroupAdded:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onJoinedGroupAdded(GroupInfo.fromJson(data)));
      break;
    case ListenerType.onJoinedGroupDeleted:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onJoinedGroupDeleted(GroupInfo.fromJson(data)));
      break;
    case ListenerType.onGroupMemberAdded:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupMemberAdded(GroupMembersInfo.fromJson(data)));
      break;
    case ListenerType.onGroupMemberDeleted:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupMemberDeleted(GroupMembersInfo.fromJson(data)));
      break;
    case ListenerType.onGroupMemberInfoChanged:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupMemberInfoChanged(GroupMembersInfo.fromJson(data)));
      break;
    case ListenerType.onGroupApplicationAccepted:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupApplicationAccepted(GroupApplicationInfo.fromJson(data)));
      break;
    case ListenerType.onGroupApplicationAdded:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupApplicationAdded(GroupApplicationInfo.fromJson(data)));
      break;
    case ListenerType.onGroupApplicationRejected:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onGroupApplicationRejected(GroupApplicationInfo.fromJson(data)));
      break;

    /// Friend
    case ListenerType.onFriendAdded:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onFriendAdded(FriendInfo.fromJson(data)));
      break;
    case ListenerType.onFriendDeleted:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onFriendDeleted(FriendInfo.fromJson(data)));
      break;
    case ListenerType.onFriendInfoChanged:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onFriendInfoChanged(FriendInfo.fromJson(data)));
      break;
    case ListenerType.onBlackAdded:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onBlacklistAdded(BlacklistInfo.fromJson(data)));
      break;
    case ListenerType.onBlackDeleted:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onBlacklistDeleted(BlacklistInfo.fromJson(data)));
      break;
    case ListenerType.onFriendApplicationAccepted:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onFriendApplicationAccepted(FriendApplicationInfo.fromJson(data)));
      break;
    case ListenerType.onFriendApplicationAdded:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onFriendApplicationAdded(FriendApplicationInfo.fromJson(data)));
      break;
    case ListenerType.onFriendApplicationRejected:
      final data = _parseJson(channel.data);
      if (data != null) OpenIMManager._onEvent((l) => l.onFriendApplicationRejected(FriendApplicationInfo.fromJson(data)));
      break;

    /// Custom
    case ListenerType.onRecvCustomBusinessMessage:
      OpenIMManager._onEvent((l) => l.onRecvCustomBusinessMessage(channel.data ?? ''));
      break;
  }
}

// ==========================================
// Helper functions for parsing WASM data
// ==========================================

Map<String, dynamic>? _parseJson(dynamic data) {
  if (data == null) return null;
  if (data is Map<String, dynamic>) return data;
  if (data is String) {
    try {
      return jsonDecode(data) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }
  return null;
}

Message? _parseMessage(dynamic data) {
  final json = _parseJson(data);
  return json != null ? Message.fromJson(json) : null;
}

List<ConversationInfo> _parseConversationList(dynamic data) {
  return IMUtils.toList(data, (map) => ConversationInfo.fromJson(map));
}
