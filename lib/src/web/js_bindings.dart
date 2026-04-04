import 'dart:js_interop';

/// =====================================================
/// JS Interop bindings for OpenIM WASM global functions
/// These are registered by wasm/cmd/main.go registerFunc()
/// =====================================================

// -------------------- Init & Login --------------------

@JS('initSDK')
external JSAny jsInitSDK(JSString operationID, JSString config);

@JS('login')
external JSAny jsLogin(JSString operationID, JSString userID, JSString token);

@JS('logout')
external JSAny jsLogout(JSString operationID);

@JS('getLoginStatus')
external JSAny jsGetLoginStatus(JSString operationID);

@JS('setAppBackgroundStatus')
external JSAny jsSetAppBackgroundStatus(JSString operationID, JSBoolean isBackground);

@JS('networkStatusChanged')
external JSAny jsNetworkStatusChanged(JSString operationID);

// -------------------- User --------------------

@JS('getSelfUserInfo')
external JSAny jsGetSelfUserInfo(JSString operationID);

@JS('setSelfInfo')
external JSAny jsSetSelfInfo(JSString operationID, JSString userInfo);

@JS('getUsersInfo')
external JSAny jsGetUsersInfo(JSString operationID, JSString userIDList);

@JS('subscribeUsersStatus')
external JSAny jsSubscribeUsersStatus(JSString operationID, JSString userIDs);

@JS('unsubscribeUsersStatus')
external JSAny jsUnsubscribeUsersStatus(JSString operationID, JSString userIDs);

@JS('getSubscribeUsersStatus')
external JSAny jsGetSubscribeUsersStatus(JSString operationID);

@JS('getUserStatus')
external JSAny jsGetUserStatus(JSString operationID, JSString userIDs);

// -------------------- Friend --------------------

@JS('getSpecifiedFriendsInfo')
external JSAny jsGetSpecifiedFriendsInfo(JSString operationID, JSString userIDList, JSBoolean filterBlack);

@JS('getFriendList')
external JSAny jsGetFriendList(JSString operationID, JSBoolean filterBlack);

@JS('getFriendListPage')
external JSAny jsGetFriendListPage(JSString operationID, JSNumber offset, JSNumber count, JSBoolean filterBlack);

@JS('searchFriends')
external JSAny jsSearchFriends(JSString operationID, JSString searchParam);

@JS('checkFriend')
external JSAny jsCheckFriend(JSString operationID, JSString userIDList);

@JS('addFriend')
external JSAny jsAddFriend(JSString operationID, JSString reqMsg);

@JS('updateFriends')
external JSAny jsUpdateFriends(JSString operationID, JSString req);

@JS('deleteFriend')
external JSAny jsDeleteFriend(JSString operationID, JSString userID);

@JS('getFriendApplicationListAsRecipient')
external JSAny jsGetFriendApplicationListAsRecipient(JSString operationID);

@JS('getFriendApplicationListAsApplicant')
external JSAny jsGetFriendApplicationListAsApplicant(JSString operationID);

@JS('acceptFriendApplication')
external JSAny jsAcceptFriendApplication(JSString operationID, JSString req);

@JS('refuseFriendApplication')
external JSAny jsRefuseFriendApplication(JSString operationID, JSString req);

@JS('getBlackList')
external JSAny jsGetBlackList(JSString operationID);

@JS('removeBlack')
external JSAny jsRemoveBlack(JSString operationID, JSString userID);

@JS('addBlack')
external JSAny jsAddBlack(JSString operationID, JSString userID, JSString ex);

@JS('getFriendApplicationUnhandledCount')
external JSAny jsGetFriendApplicationUnhandledCount(JSString operationID);

// -------------------- Group --------------------

@JS('createGroup')
external JSAny jsCreateGroup(JSString operationID, JSString groupReqInfo);

@JS('getSpecifiedGroupsInfo')
external JSAny jsGetSpecifiedGroupsInfo(JSString operationID, JSString groupIDList);

@JS('joinGroup')
external JSAny jsJoinGroup(JSString operationID, JSString groupID, JSString reqMsg, JSNumber joinSource, JSString ex);

@JS('quitGroup')
external JSAny jsQuitGroup(JSString operationID, JSString groupID);

@JS('dismissGroup')
external JSAny jsDismissGroup(JSString operationID, JSString groupID);

@JS('changeGroupMute')
external JSAny jsChangeGroupMute(JSString operationID, JSString groupID, JSBoolean isMute);

@JS('changeGroupMemberMute')
external JSAny jsChangeGroupMemberMute(JSString operationID, JSString groupID, JSString userID, JSNumber seconds);

@JS('setGroupMemberInfo')
external JSAny jsSetGroupMemberInfo(JSString operationID, JSString groupMemberInfo);

@JS('getJoinedGroupList')
external JSAny jsGetJoinedGroupList(JSString operationID);

@JS('getJoinedGroupListPage')
external JSAny jsGetJoinedGroupListPage(JSString operationID, JSNumber offset, JSNumber count);

@JS('searchGroups')
external JSAny jsSearchGroups(JSString operationID, JSString searchParam);

@JS('setGroupInfo')
external JSAny jsSetGroupInfo(JSString operationID, JSString groupInfo);

@JS('getGroupMemberList')
external JSAny jsGetGroupMemberList(JSString operationID, JSString groupID, JSNumber filter, JSNumber offset, JSNumber count);

@JS('getGroupMemberOwnerAndAdmin')
external JSAny jsGetGroupMemberOwnerAndAdmin(JSString operationID, JSString groupID);

@JS('getGroupMemberListByJoinTimeFilter')
external JSAny jsGetGroupMemberListByJoinTimeFilter(JSString operationID, JSString groupID, JSNumber offset, JSNumber count, JSNumber joinTimeBegin, JSNumber joinTimeEnd, JSString filterUserIDList);

@JS('getSpecifiedGroupMembersInfo')
external JSAny jsGetSpecifiedGroupMembersInfo(JSString operationID, JSString groupID, JSString userIDList);

@JS('kickGroupMember')
external JSAny jsKickGroupMember(JSString operationID, JSString groupID, JSString reason, JSString userIDList);

@JS('transferGroupOwner')
external JSAny jsTransferGroupOwner(JSString operationID, JSString groupID, JSString newOwnerUserID);

@JS('inviteUserToGroup')
external JSAny jsInviteUserToGroup(JSString operationID, JSString groupID, JSString reason, JSString userIDList);

@JS('getGroupApplicationListAsRecipient')
external JSAny jsGetGroupApplicationListAsRecipient(JSString operationID);

@JS('getGroupApplicationListAsApplicant')
external JSAny jsGetGroupApplicationListAsApplicant(JSString operationID);

@JS('acceptGroupApplication')
external JSAny jsAcceptGroupApplication(JSString operationID, JSString groupID, JSString fromUserID, JSString handleMsg);

@JS('refuseGroupApplication')
external JSAny jsRefuseGroupApplication(JSString operationID, JSString groupID, JSString fromUserID, JSString handleMsg);

@JS('searchGroupMembers')
external JSAny jsSearchGroupMembers(JSString operationID, JSString searchParam);

@JS('isJoinGroup')
external JSAny jsIsJoinGroup(JSString operationID, JSString groupID);

@JS('getUsersInGroup')
external JSAny jsGetUsersInGroup(JSString operationID, JSString groupID, JSString userIDs);

@JS('getGroupApplicationUnhandledCount')
external JSAny jsGetGroupApplicationUnhandledCount(JSString operationID);

// -------------------- Conversation --------------------

@JS('getAllConversationList')
external JSAny jsGetAllConversationList(JSString operationID);

@JS('getConversationListSplit')
external JSAny jsGetConversationListSplit(JSString operationID, JSNumber offset, JSNumber count);

@JS('getOneConversation')
external JSAny jsGetOneConversation(JSString operationID, JSNumber sessionType, JSString sourceID);

@JS('getMultipleConversation')
external JSAny jsGetMultipleConversation(JSString operationID, JSString conversationIDList);

@JS('deleteConversationAndDeleteAllMsg')
external JSAny jsDeleteConversationAndDeleteAllMsg(JSString operationID, JSString conversationID);

@JS('setConversation')
external JSAny jsSetConversation(JSString operationID, JSString conversationID, JSString req);

@JS('setConversationDraft')
external JSAny jsSetConversationDraft(JSString operationID, JSString conversationID, JSString draftText);

@JS('hideConversation')
external JSAny jsHideConversation(JSString operationID, JSString conversationID);

@JS('hideAllConversations')
external JSAny jsHideAllConversations(JSString operationID);

@JS('clearConversationAndDeleteAllMsg')
external JSAny jsClearConversationAndDeleteAllMsg(JSString operationID, JSString conversationID);

@JS('getTotalUnreadMsgCount')
external JSAny jsGetTotalUnreadMsgCount(JSString operationID);

@JS('markConversationMessageAsRead')
external JSAny jsMarkConversationMessageAsRead(JSString operationID, JSString conversationID);

@JS('markAllConversationMessageAsRead')
external JSAny jsMarkAllConversationMessageAsRead(JSString operationID);

@JS('markMessagesAsReadByMsgID')
external JSAny jsMarkMessagesAsReadByMsgID(JSString operationID, JSString conversationID, JSString messageIDList);

@JS('searchConversation')
external JSAny jsSearchConversation(JSString operationID, JSString name);

@JS('changeInputStates')
external JSAny jsChangeInputStates(JSString operationID, JSString conversationID, JSBoolean focus);

@JS('getInputStates')
external JSAny jsGetInputStates(JSString operationID, JSString conversationID, JSString userID);

// -------------------- Message --------------------

@JS('createTextMessage')
external JSAny jsCreateTextMessage(JSString operationID, JSString text);

@JS('createImageMessage')
external JSAny jsCreateImageMessage(JSString operationID, JSString imagePath);

@JS('createImageMessageByURL')
external JSAny jsCreateImageMessageByURL(JSString operationID, JSString sourcePath, JSString sourcePicture, JSString bigPicture, JSString snapshotPicture);

@JS('createSoundMessageByURL')
external JSAny jsCreateSoundMessageByURL(JSString operationID, JSString soundElem);

@JS('createVideoMessageByURL')
external JSAny jsCreateVideoMessageByURL(JSString operationID, JSString videoElem);

@JS('createFileMessageByURL')
external JSAny jsCreateFileMessageByURL(JSString operationID, JSString fileElem);

@JS('createCustomMessage')
external JSAny jsCreateCustomMessage(JSString operationID, JSString data, JSString extension, JSString description);

@JS('createQuoteMessage')
external JSAny jsCreateQuoteMessage(JSString operationID, JSString text, JSString quoteMsg);

@JS('createAdvancedQuoteMessage')
external JSAny jsCreateAdvancedQuoteMessage(JSString operationID, JSString text, JSString message, JSString messageEntityList);

@JS('createAdvancedTextMessage')
external JSAny jsCreateAdvancedTextMessage(JSString operationID, JSString text, JSString messageEntityList);

@JS('createCardMessage')
external JSAny jsCreateCardMessage(JSString operationID, JSString data);

@JS('createTextAtMessage')
external JSAny jsCreateTextAtMessage(JSString operationID, JSString text, JSString atUserIDList, JSString atUserInfoList, JSString quoteMessage);

@JS('createVideoMessage')
external JSAny jsCreateVideoMessage(JSString operationID, JSString videoPath, JSString videoType, JSNumber duration, JSString snapshotPath);

@JS('createFileMessage')
external JSAny jsCreateFileMessage(JSString operationID, JSString filePath, JSString fileName);

@JS('createMergerMessage')
external JSAny jsCreateMergerMessage(JSString operationID, JSString messageList, JSString title, JSString summaryList);

@JS('createFaceMessage')
external JSAny jsCreateFaceMessage(JSString operationID, JSNumber index, JSString data);

@JS('createForwardMessage')
external JSAny jsCreateForwardMessage(JSString operationID, JSString message);

@JS('createLocationMessage')
external JSAny jsCreateLocationMessage(JSString operationID, JSString description, JSNumber longitude, JSNumber latitude);

@JS('createImageMessageFromFullPath')
external JSAny jsCreateImageMessageFromFullPath(JSString operationID, JSString imagePath);

@JS('createSoundMessageFromFullPath')
external JSAny jsCreateSoundMessageFromFullPath(JSString operationID, JSString soundPath, JSNumber duration);

@JS('createSoundMessage')
external JSAny jsCreateSoundMessage(JSString operationID, JSString soundPath, JSNumber duration);

@JS('createVideoMessageFromFullPath')
external JSAny jsCreateVideoMessageFromFullPath(JSString operationID, JSString videoPath, JSString videoType, JSNumber duration, JSString snapshotPath);

@JS('createFileMessageFromFullPath')
external JSAny jsCreateFileMessageFromFullPath(JSString operationID, JSString filePath, JSString fileName);

@JS('sendMessage')
external JSAny jsSendMessage(JSString operationID, JSString message, JSString userID, JSString groupID, JSString offlinePushInfo, JSBoolean isOnlineOnly);

@JS('sendMessageNotOss')
external JSAny jsSendMessageNotOss(JSString operationID, JSString message, JSString userID, JSString groupID, JSString offlinePushInfo, JSBoolean isOnlineOnly);

@JS('getAdvancedHistoryMessageList')
external JSAny jsGetAdvancedHistoryMessageList(JSString operationID, JSString getMessageOptions);

@JS('getAdvancedHistoryMessageListReverse')
external JSAny jsGetAdvancedHistoryMessageListReverse(JSString operationID, JSString getMessageOptions);

@JS('findMessageList')
external JSAny jsFindMessageList(JSString operationID, JSString searchParams);

@JS('revokeMessage')
external JSAny jsRevokeMessage(JSString operationID, JSString conversationID, JSString clientMsgID);

@JS('typingStatusUpdate')
external JSAny jsTypingStatusUpdate(JSString operationID, JSString userID, JSString msgTip);

@JS('deleteMessageFromLocalStorage')
external JSAny jsDeleteMessageFromLocalStorage(JSString operationID, JSString conversationID, JSString clientMsgID);

@JS('deleteMessage')
external JSAny jsDeleteMessage(JSString operationID, JSString conversationID, JSString clientMsgID);

@JS('deleteAllMsgFromLocal')
external JSAny jsDeleteAllMsgFromLocal(JSString operationID);

@JS('deleteAllMsgFromLocalAndSvr')
external JSAny jsDeleteAllMsgFromLocalAndSvr(JSString operationID);

@JS('insertSingleMessageToLocalStorage')
external JSAny jsInsertSingleMessageToLocalStorage(JSString operationID, JSString message, JSString receiverID, JSString senderID);

@JS('insertGroupMessageToLocalStorage')
external JSAny jsInsertGroupMessageToLocalStorage(JSString operationID, JSString message, JSString groupID, JSString senderID);

@JS('searchLocalMessages')
external JSAny jsSearchLocalMessages(JSString operationID, JSString searchParam);

@JS('setMessageLocalEx')
external JSAny jsSetMessageLocalEx(JSString operationID, JSString conversationID, JSString clientMsgID, JSString localEx);

@JS('getAtAllTag')
external JSAny jsGetAtAllTag(JSString operationID);

// -------------------- Third Party --------------------

@JS('updateFcmToken')
external JSAny jsUpdateFcmToken(JSString operationID, JSString fcmToken, JSNumber expireTime);

@JS('uploadFile')
external JSAny jsUploadFile(JSString operationID, JSString req, JSString uuid);

// -------------------- Event --------------------

/// Register the global event callback function.
/// WASM side calls this `commonEventFunc` to push all
/// listener events (connection, message, conversation, etc.)
@JS('commonEventFunc')
external void jsCommonEventFunc(JSFunction callback);
