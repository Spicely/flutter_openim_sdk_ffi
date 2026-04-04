part of '../../../openim_web_impl.dart';

/// Web implementation of ConversationManager.
class ConversationManager {
  Future<List<ConversationInfo>> getAllConversationList({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetAllConversationList(opID.toJS));
    if (result == null) return <ConversationInfo>[];
    final decoded = jsonDecode(OpenIMManager.ensureResultString(result));
    if (decoded == null) return <ConversationInfo>[];
    return (decoded as List).map((e) => ConversationInfo.fromJson(e)).toList();
  }

  Future<List<ConversationInfo>> getConversationListSplit({
    int offset = 0,
    int count = 20,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetConversationListSplit(opID.toJS, offset.toJS, count.toJS));
    if (result == null) return <ConversationInfo>[];
    final decoded = jsonDecode(OpenIMManager.ensureResultString(result));
    if (decoded == null) return <ConversationInfo>[];
    return (decoded as List).map((e) => ConversationInfo.fromJson(e)).toList();
  }

  Future<ConversationInfo> getOneConversation({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetOneConversation(opID.toJS, sessionType.toJS, sourceID.toJS));
    if (result == null) return null as dynamic;
    return ConversationInfo.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<List<ConversationInfo>> getMultipleConversation({
    required List<String> conversationIDList,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetMultipleConversation(opID.toJS, jsonEncode(conversationIDList).toJS));
    if (result == null) return <ConversationInfo>[];
    final decoded = jsonDecode(OpenIMManager.ensureResultString(result));
    if (decoded == null) return <ConversationInfo>[];
    return (decoded as List).map((e) => ConversationInfo.fromJson(e)).toList();
  }

  Future<void> setConversationDraft({
    required String conversationID,
    required String draftText,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSetConversationDraft(opID.toJS, conversationID.toJS, draftText.toJS));
  }

  Future<void> hideConversation({required String conversationID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsHideConversation(opID.toJS, conversationID.toJS));
  }

  Future<void> hideAllConversation({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsHideAllConversations(opID.toJS));
  }

  Future<String> getConversationIDBySessionType({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) async {
    if (sessionType == 1) return 'si_$sourceID';
    if (sessionType == 2) return 'sg_$sourceID';
    if (sessionType == 3) return 'sg_$sourceID';
    if (sessionType == 4) return 'sn_$sourceID';
    return sourceID;
  }

  Future<void> deleteConversation({required String conversationID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDeleteConversationAndDeleteAllMsg(opID.toJS, conversationID.toJS));
  }

  Future<int> getTotalUnreadMsgCount({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetTotalUnreadMsgCount(opID.toJS));
    if (result == null) return null as dynamic;
    return int.parse(OpenIMManager.ensureResultString(result));
  }

  Future<void> deleteConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDeleteConversationAndDeleteAllMsg(opID.toJS, conversationID.toJS));
  }

  Future<void> clearConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsClearConversationAndDeleteAllMsg(opID.toJS, conversationID.toJS));
  }

  Future<dynamic> getAtAllTag({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetAtAllTag(opID.toJS));
    if (result == null) return null as dynamic;
    return jsonDecode(OpenIMManager.ensureResultString(result));
  }

  String get atAllTag => 'AtAllTag';

  Future<void> setOneConversationBurnDuration({
    required String conversationID,
    int burnDuration = 30,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final req = jsonEncode({'burnDuration': burnDuration});
    await OpenIMManager.callPromise(jsSetConversation(opID.toJS, conversationID.toJS, req.toJS));
  }

  Future<void> markConversationMessageAsRead({
    required String conversationID,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsMarkConversationMessageAsRead(opID.toJS, conversationID.toJS));
  }

  Future<List<ConversationInfo>> searchConversations({
    required String name,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSearchConversation(opID.toJS, name.toJS));
    if (result == null) return <ConversationInfo>[];
    final decoded = jsonDecode(OpenIMManager.ensureResultString(result));
    if (decoded == null) return <ConversationInfo>[];
    return (decoded as List).map((e) => ConversationInfo.fromJson(e)).toList();
  }

  List<ConversationInfo> simpleSort(List<ConversationInfo> list) => list
    ..sort((a, b) {
      if ((a.isPinned == true && b.isPinned == true) || (a.isPinned != true && b.isPinned != true)) {
        int aCompare = a.draftTextTime! > a.latestMsgSendTime! ? a.draftTextTime! : a.latestMsgSendTime!;
        int bCompare = b.draftTextTime! > b.latestMsgSendTime! ? b.draftTextTime! : b.latestMsgSendTime!;
        if (aCompare > bCompare) return -1;
        if (aCompare < bCompare) return 1;
        return 0;
      } else if (a.isPinned == true && b.isPinned != true) {
        return -1;
      }
      return 1;
    });

  Future<void> changeInputStates({
    required String conversationID,
    required bool focus,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsChangeInputStates(opID.toJS, conversationID.toJS, focus.toJS));
  }

  Future<List<int>?> getInputStates(String conversationID, String userID, {String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsGetInputStates(opID.toJS, conversationID.toJS, userID.toJS));
    if (result == null) return null;
    return (jsonDecode(OpenIMManager.ensureResultString(result)) as List).cast<int>();
  }

  Future<void> setConversation({
    required String conversationID,
    required ConversationReq req,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSetConversation(opID.toJS, conversationID.toJS, jsonEncode(req.toJson()).toJS));
  }
}
