part of '../flutter_openim_sdk_ffi.dart';

/*
 * Summary: 文件描述
 * Created Date: 2023-06-01 23:37:30
 * Author: Spicely
 * -----
 * Last Modified: 2023-08-16 16:43:20
 * Modified By: Spicely
 * -----
 * Copyright (c) 2023 Spicely Inc.
 * 
 * May the force be with you.
 * -----
 * HISTORY:
 * Date      	By	Comments
 */
mixin OpenIMListener {
  /// 消息发送进度回调，一般在发送文件类消息时使用。
  void onProgress(String clientMsgID, int progress) {}

  /// 在同步服务器进度。
  void onSyncServerProgress(int progress) {}

  /// 某个用户的黑名单列表增加时会收到该回调
  void onBlacklistAdded(BlacklistInfo u) {}

  /// 某个用户的黑名单列表减少时会收到该回调。
  void onBlacklistDeleted(BlacklistInfo u) {}

  /// 某些会话的关键信息发生变化时，会触发该回调，例如会话的未读数发生变化，会话的最后一条消息发生变化等。
  void onConversationChanged(List<ConversationInfo> list) {}

  /// 两个用户成功建立好友关系后双方都会收到该回调。
  void onFriendAdded(FriendInfo info) {}

  /// 好友申请被同意时，申请发起方和接收方都会收到该回调，双方成功建立好友关系。
  void onFriendApplicationAccepted(FriendApplicationInfo u) {}

  /// 用户发起好友申请后，申请发起者和接收者都会收到此回调，接收者可以选择同意或拒绝好友申请。
  void onFriendApplicationAdded(FriendApplicationInfo u) {}

  /// 好友申请被拒绝时，申请发起方和接收方都会收到该回调。
  void onFriendApplicationRejected(FriendApplicationInfo u) {}

  /// 某个用户的好友列表减少时会收到该回调。
  void onFriendDeleted(FriendInfo u) {}

  /// 好友个人信息（包括备注）改变时会收到此回调。
  void onFriendInfoChanged(FriendInfo u) {}

  /// 入群申请被同意时，申请发起者以及该群的群主、管理员会收到此回调。
  void onGroupApplicationAccepted(GroupApplicationInfo u) {}

  /// 用户发起入群申请后，如进群需要审批， 则申请发起者以及该群的群主、管理员会收到此回调。
  void onGroupApplicationAdded(GroupApplicationInfo u) {}

  /// 入群申请被拒绝时，申请发起者以及该群的群主、管理员会收到此回调。
  void onGroupApplicationRejected(GroupApplicationInfo u) {}

  /// 群组被解散时，该群所有群成员会收到此回调。
  void onGroupDismissed(GroupInfo info) {}

  /// 群组信息（头像、群名称等，也包括群主变化）改变时，该群所有群成员会收到此回调。
  void onGroupInfoChanged(GroupInfo info) {}

  /// 群成员增加（如用户被邀请进群），其他群成员会收到此回调。
  void onGroupMemberAdded(GroupMembersInfo info) {}

  /// 群成员减少（如群成员退群）， 其他群成员会收到此回调。
  void onGroupMemberDeleted(GroupMembersInfo info) {}

  /// 群成员信息改变（群昵称、头像等）后回调，该群所有群成员会收到此回调。
  void onGroupMemberInfoChanged(GroupMembersInfo info) {}

  /// 用户所在群组的数量增加时（被邀请入群、入群申请被同意等），会收到此回调。
  void onJoinedGroupAdded(GroupInfo info) {}

  /// 用户所在群组的数量减少时（主动退群、群被解散等），会收到此回调。
  void onJoinedGroupDeleted(GroupInfo info) {}

  /// 有新会话产生时，会收到此回调。
  void onNewConversation(List<ConversationInfo> list) {}

  /// 收到的消息被撤回或自己发出的消息被撤回时，会收到此回调。
  void onNewRecvMessageRevoked(RevokedInfo info) {}

  /// 自己发出的单聊消息被对方标记为已读后，消息发送者会收到此回调。
  void onRecvC2CReadReceipt(List<ReadReceiptInfo> list) {}

  /// 自己发出的群聊消息被群成员标记为已读后，消息发送者和标记者均会收到此回调。
  void onRecvGroupReadReceipt(List<ReadReceiptInfo> list) {}

  /// 接收到新消息时会收到此回调，回调中只会携带一条消息。
  void onRecvNewMessage(Message msg) {}

  /// 当应用在后台运行，接收到新消息时，会收到该回调，回调中只会携带一条消息。
  void onRecvOfflineNewMessage(Message msg) {}

  /// 接收到仅在线新消息时会收到此回调，回调中只会携带一条消息。
  void onRecvOnlineOnlyMessage(Message msg) {}

  /// 当前登录用户个人信息改变时会收到此回调。
  void onSelfInfoUpdated(UserInfo info) {}

  /// 向服务器同步会话失败时的回调。
  void onSyncServerFailed(bool reinstalled) {}

  /// 向服务器同步会话成功时的回调。
  void onSyncServerFinish(bool reinstalled) {}

  /// 向服务器同步会话开始时的回调。
  void onSyncServerStart(bool reinstalled) {}

  /// token无效回调。
  void onTotalUnreadMessageCountChanged(int count) {}

  /// 已订阅用户的在线状态发生变化时，会触发此回调。
  void onUserStatusChanged(UserStatusInfo info) {}

  /// 建立WebSocket连接失败返回后，触发此回调
  void onConnectFailed(int code, String errorMsg) {}

  /// 建立WebSocket连接成功返回后，触发此回调
  void onConnectSuccess() {}

  /// 建立WebSocket连接中，触发此回调
  void onConnecting() {}

  /// 已订阅用户的在线状态发生变化时，会触发此回调。
  void onInputStatusChanged(InputStatusChangedData info) {}

  /// 由于 APP 管理员强制用户下线，或由于登录策略导致用户被踢下线
  void onKickedOffline() {}

  /// token过期。
  void onUserTokenExpired() {}

  /// token无效回调。
  void onUserTokenInvalid(String error) {}

  /// 文件打开的大小
  void onUploadFileOpen(String id, int size) {}

  /// 分片大小,数量
  void onUploadFilePartSize(String id, int partSize, int num) {}

  /// 每块分片的hash值
  void onUploadFileHashPartProgress(String id, int index, int size, String partHash) {}

  /// 分块完成，服务端标记hash和文件最终hash
  void onUploadFileHashPartComplete(String id, String partHash, String fileHash) {}

  /// 上传ID
  void onUploadFileID(String id, String uploadID) {}

  /// 上传分片进度
  void onUploadFilePartComplete(String id, int index, int partSize, String partHash) {}

  /// 整体进度
  void onUploadFileProgress(String id, int fileSize, int streamSize, int storageSize) {}

  /// 上传完成
  void onUploadFileComplete(String id, int size, String url, int type) {}

  /// 自定义通知
  void onRecvCustomBusinessMessage(String businessMessage) {}
}
