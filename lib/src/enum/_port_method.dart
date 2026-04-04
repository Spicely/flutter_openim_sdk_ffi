part of '../../flutter_openim_sdk_ffi_native.dart';

/*
 * Summary: 扩展字符串
 * Created Date: 2023-06-11 17:47:26
 * Author: Spicely
 * -----
 * Last Modified: 2023-08-22 17:02:29
 * Modified By: Spicely
 * -----
 * Copyright (c) 2023 Spicely Inc.
 * 
 * May the force be with you.
 * -----
 * HISTORY:
 * Date      	By	Comments
 */

class _PortMethod {
  /// 初始化、登录
  static const String initSDK = 'initSDK';
  static const String login = 'Login';
  static const String logout = 'Logout';
  static const String getLoginStatus = 'GetLoginStatus';

  /// 用户相关
  static const String getSelfUserInfo = 'GetSelfUserInfo';
  static const String setSelfInfo = 'SetSelfInfo';
  static const String getUsersInfo = 'GetUsersInfo';
  static const String subscribeUsersStatus = 'SubscribeUsersStatus';
  static const String unsubscribeUsersStatus = 'UnsubscribeUsersStatus';
  static const String getSubscribeUsersStatus = 'GetSubscribeUsersStatus';

  /// 关系链相关
  static const String acceptFriendApplication = 'AcceptFriendApplication';
  static const String addBlacklist = 'AddBlacklist';
  static const String addFriend = 'AddFriend';
  static const String checkFriend = 'CheckFriend';
  static const String deleteFriend = 'DeleteFriend';
  static const String getBlackList = 'GetBlackList';
  static const String getFriendApplicationListAsApplicant = 'GetFriendApplicationListAsApplicant';
  static const String getFriendApplicationListAsRecipient = 'GetFriendApplicationListAsRecipient';
  static const String getFriendList = 'GetFriendList';
  static const String getFriendListPage = 'GetFriendListPage';
  static const String getFriendsInfo = 'GetSpecifiedFriendsInfo';
  static const String refuseFriendApplication = 'RefuseFriendApplication';
  static const String removeBlacklist = 'RemoveBlacklist';
  static const String searchFriends = 'SearchFriends';
  static const String updateFriends = 'updateFriends';

  /// 群组相关
  static const String createGroup = 'CreateGroup';
  static const String joinGroup = 'JoinGroup';
  static const String inviteUserToGroup = 'InviteUserToGroup';
  static const String getJoinedGroupList = 'GetJoinedGroupList';
  static const String searchGroups = 'SearchGroups';
  static const String getGroupsInfo = 'GetSpecifiedGroupsInfo';
  static const String setGroupInfo = 'SetGroupInfo';
  static const String getGroupApplicationListAsRecipient = 'GetGroupApplicationListAsRecipient';
  static const String getGroupApplicationListAsApplicant = 'GetGroupApplicationListAsApplicant';
  static const String acceptGroupApplication = 'AcceptGroupApplication';
  static const String refuseGroupApplication = 'RefuseGroupApplication';
  static const String getGroupMemberList = 'GetGroupMemberList';
  static const String searchGroupMembers = 'SearchGroupMembers';
  static const String setGroupMemberInfo = 'SetGroupMemberInfo';
  static const String getGroupMemberOwnerAndAdmin = 'GetGroupMemberOwnerAndAdmin';
  static const String getGroupMemberListByJoinTimeFilter = 'GetGroupMemberListByJoinTimeFilter';
  static const String getGroupMembersInfo = 'GetSpecifiedGroupMembersInfo';
  static const String kickGroupMember = 'KickGroupMember';
  static const String changeGroupMemberMute = 'ChangeGroupMemberMute';
  static const String changeGroupMute = 'ChangeGroupMute';
  static const String transferGroupOwner = 'TransferGroupOwner';
  static const String dismissGroup = 'DismissGroup';
  static const String getUsersInGroup = 'getUsersInGroup';
  static const String isJoinGroup = 'IsJoinGroup';
  static const String quitGroup = 'QuitGroup';

  /// 会话相关
  static const String getAllConversationList = 'GetAllConversationList';
  static const String getConversationListSplit = 'GetConversationListSplit';
  static const String getOneConversation = 'GetOneConversation';
  static const String getMultipleConversation = 'GetMultipleConversation';
  static const String getConversationIDBySessionType = 'GetConversationIDBySessionType';
  static const String getTotalUnreadMsgCount = 'GetTotalUnreadMsgCount';
  static const String markConversationMessageAsRead = 'MarkConversationMessageAsRead';
  static const String setConversationDraft = 'SetConversationDraft';
  static const String setConversation = 'setConversation';
  static const String hideConversation = 'hideConversation';
  static const String changeInputStates = 'ChangeInputStates';
  static const String hideAllConversations = 'hideAllConversations';
  static const String clearConversationAndDeleteAllMsg = 'clearConversationAndDeleteAllMsg';
  static const String getInputStates = 'GetInputStates';
  static const String deleteConversationAndDeleteAllMsg = 'DeleteConversationAndDeleteAllMsg';

  /// 消息相关
  static const String createTextMessage = 'CreateTextMessage';
  static const String createTextAtMessage = 'CreateTextAtMessage';
  static const String createImageMessageFromFullPath = 'CreateImageMessageFromFullPath';
  static const String createImageMessageByURL = 'CreateImageMessageByURL';
  static const String createSoundMessageFromFullPath = 'CreateSoundMessageFromFullPath';
  static const String createSoundMessageByURL = 'CreateSoundMessageByURL';
  static const String createVideoMessageFromFullPath = 'CreateVideoMessageFromFullPath';
  static const String createVideoMessageByURL = 'CreateVideoMessageByURL';
  static const String createFileMessageFromFullPath = 'CreateFileMessageFromFullPath';
  static const String createFileMessageByURL = 'CreateFileMessageByURL';
  static const String createForwardMessage = 'CreateForwardMessage';
  static const String createLocationMessage = 'CreateLocationMessage';
  static const String createQuoteMessage = 'CreateQuoteMessage';
  static const String createCardMessage = 'CreateCardMessage';
  static const String createCustomMessage = 'CreateCustomMessage';
  static const String createFaceMessage = 'CreateFaceMessage';
  static const String sendMessage = 'SendMessage';
  static const String sendMessageNotOss = 'SendMessageNotOss';
  static const String typingStatusUpdate = 'TypingStatusUpdate';
  static const String revokeMessage = 'RevokeMessage';
  static const String deleteMessage = 'DeleteMessage';
  static const String deleteMessageFromLocalStorage = 'DeleteMessageFromLocalStorage';
  static const String deleteAllMsgFromLocal = 'DeleteAllMsgFromLocal';
  static const String deleteAllMsgFromLocalAndSvr = 'DeleteAllMsgFromLocalAndSvr';
  static const String searchLocalMessages = 'SearchLocalMessages';
  static const String getAdvancedHistoryMessageList = 'GetAdvancedHistoryMessageList';
  static const String getAdvancedHistoryMessageListReverse = 'GetAdvancedHistoryMessageListReverse';
  static const String findMessageList = 'FindMessageList';
  static const String insertGroupMessageToLocalStorage = 'InsertGroupMessageToLocalStorage';
  static const String insertSingleMessageToLocalStorage = 'InsertSingleMessageToLocalStorage';
  static const String setMessageLocalEx = 'SetMessageLocalEx';
  static const String createImageMessage = 'CreateImageMessage';
  static const String createSoundMessage = 'CreateSoundMessage';
  static const String createVideoMessage = 'CreateVideoMessage';
  static const String createFileMessage = 'CreateFileMessage';
  static const String createMergerMessage = 'CreateMergerMessage';

  /// other
  static const String version = 'Version';
  static const String uploadLogs = 'UploadLogs';
  static const String logs = 'Logs';
  static const String uploadFile = 'UploadFile';
  static const String updateFcmToken = 'UpdateFcmToken';
  static const String setAppBadge = 'SetAppBadge';

  /*----------*/

  /// 根据会话id获取多个会话
  static const String getUserStatus = 'GetUserStatus';

  /// 通过会话id删除指定会话
  static const String deleteConversation = 'DeleteConversation';
  static const String searchConversations = 'SearchConversations';
  static const String getAtAllTag = 'GetAtAllTag';
  static const String setOneConversationBurnDuration = 'SetOneConversationBurnDuration';

  /// 消息

  static const String markMessageAsReadByMsgID = 'markMessageAsReadByMsgID';

  static const String createAdvancedTextMessage = 'CreateAdvancedTextMessage';
  static const String createAdvancedQuoteMessage = 'CreateAdvancedQuoteMessage';

  // static const String getFriendListMap = 'GetFriendListMap';
  // static const String getFriendListPageMap = 'GetFriendListPageMap';

  static const String networkStatusChanged = 'NetworkStatusChanged';
  static const String setAppBackgroundStatus = 'SetAppBackgroundStatus';

  static const String wakeUp = 'WakeUp';
}
