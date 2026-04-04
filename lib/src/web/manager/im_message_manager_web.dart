part of '../../../openim_web_impl.dart';

/// Web implementation of MessageManager.
class MessageManager {
  MessageManager();

  String _unwrapMessage(dynamic result) {
    if (result == null || result == '') return '{}';
    final str = OpenIMManager.ensureResultString(result);
    try {
      final decoded = jsonDecode(str);
      if (decoded is List && decoded.isNotEmpty) {
        final first = decoded[0];
        if (first is String) return first;
        if (first is Map) return jsonEncode(first);
        return first.toString();
      }
      if (decoded is String) return decoded;
      if (decoded is Map) return jsonEncode(decoded);
    } catch (_) {}
    return str;
  }

  Future<Message> sendMessage({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    bool isOnlineOnly = false,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    try {
      final jsResult = jsSendMessage(
        opID.toJS,
        jsonEncode(message.toJson()).toJS,
        (userID ?? '').toJS,
        (groupID ?? '').toJS,
        jsonEncode(offlinePushInfo.toJson()).toJS,
        isOnlineOnly.toJS,
      );
      print('[OpenIM] jsSendMessage returned: $jsResult');
      final result = await OpenIMManager.callPromise(jsResult);
      print('[OpenIM] sendMessage callPromise resolved: $result');
      if (result == null) return null as dynamic;
      return Message.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
    } catch (e) {
      print('[OpenIM] sendMessage catch error: $e');
      rethrow;
    }
  }

  Future<void> deleteMessageFromLocalStorage({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDeleteMessageFromLocalStorage(opID.toJS, conversationID.toJS, clientMsgID.toJS));
  }

  Future<void> deleteMessageFromLocalAndSvr({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDeleteMessage(opID.toJS, conversationID.toJS, clientMsgID.toJS));
  }

  Future<void> deleteAllMsgFromLocal({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDeleteAllMsgFromLocal(opID.toJS));
  }

  Future<void> deleteAllMsgFromLocalAndSvr({String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsDeleteAllMsgFromLocalAndSvr(opID.toJS));
  }

  Future<Message> createTextMessage({required String text, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateTextMessage(opID.toJS, text.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createTextAtMessage({
    required String text,
    required List<String> atUserIDList,
    List<AtUserInfo> atUserInfoList = const [],
    Message? quoteMessage,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateTextAtMessage(
      opID.toJS,
      text.toJS,
      jsonEncode(atUserIDList).toJS,
      jsonEncode(atUserInfoList.map((e) => e.toJson()).toList()).toJS,
      (quoteMessage != null ? jsonEncode(quoteMessage.toJson()) : '').toJS,
    ));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createImageMessage({required String imagePath, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateImageMessage(opID.toJS, imagePath.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createImageMessageFromFullPath({required String imagePath, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateImageMessageFromFullPath(opID.toJS, imagePath.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createSoundMessage({required String soundPath, required int duration, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateSoundMessage(opID.toJS, soundPath.toJS, duration.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createSoundMessageFromFullPath({required String soundPath, required int duration, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateSoundMessageFromFullPath(opID.toJS, soundPath.toJS, duration.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createVideoMessage({
    required String videoPath, required String videoType,
    required int duration, required String snapshotPath, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateVideoMessage(opID.toJS, videoPath.toJS, videoType.toJS, duration.toJS, snapshotPath.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createVideoMessageFromFullPath({
    required String videoPath, required String videoType,
    required int duration, required String snapshotPath, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateVideoMessageFromFullPath(opID.toJS, videoPath.toJS, videoType.toJS, duration.toJS, snapshotPath.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createFileMessage({required String filePath, required String fileName, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateFileMessage(opID.toJS, filePath.toJS, fileName.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createFileMessageFromFullPath({required String filePath, required String fileName, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateFileMessageFromFullPath(opID.toJS, filePath.toJS, fileName.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createMergerMessage({
    required List<Message> messageList, required String title,
    required List<String> summaryList, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateMergerMessage(
      opID.toJS,
      jsonEncode(messageList.map((e) => e.toJson()).toList()).toJS,
      title.toJS,
      jsonEncode(summaryList).toJS,
    ));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createForwardMessage({required Message message, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateForwardMessage(opID.toJS, jsonEncode(message.toJson()).toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createLocationMessage({
    required double latitude, required double longitude,
    required String description, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateLocationMessage(opID.toJS, description.toJS, longitude.toJS, latitude.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createCustomMessage({
    required String data, required String extension,
    required String description, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateCustomMessage(opID.toJS, data.toJS, extension.toJS, description.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createQuoteMessage({required String text, required Message quoteMsg, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateQuoteMessage(opID.toJS, text.toJS, jsonEncode(quoteMsg.toJson()).toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createCardMessage({
    required String userID, required String nickname,
    String? faceURL, String? ex, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final data = jsonEncode({'userID': userID, 'nickname': nickname, 'faceURL': faceURL ?? '', 'ex': ex ?? ''});
    final result = await OpenIMManager.callPromise(jsCreateCardMessage(opID.toJS, data.toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<Message> createFaceMessage({int index = -1, String? data, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsCreateFaceMessage(opID.toJS, index.toJS, (data ?? '').toJS));
    final unwrapped = _unwrapMessage(result);
    return Message.fromJson(jsonDecode(unwrapped));
  }

  Future<void> revokeMessage({required String conversationID, required String clientMsgID, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsRevokeMessage(opID.toJS, conversationID.toJS, clientMsgID.toJS));
  }

  Future<SearchResult> searchLocalMessages({
    String? conversationID, List<String> keywordList = const [],
    int keywordListMatchType = 0, List<String> senderUserIDList = const [],
    List<int> messageTypeList = const [], int searchTimePosition = 0,
    int searchTimePeriod = 0, int pageIndex = 1, int count = 40, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final param = jsonEncode({
      'conversationID': conversationID, 'keywordList': keywordList,
      'keywordListMatchType': keywordListMatchType, 'senderUserIDList': senderUserIDList,
      'messageTypeList': messageTypeList, 'searchTimePosition': searchTimePosition,
      'searchTimePeriod': searchTimePeriod, 'pageIndex': pageIndex, 'count': count,
    });
    final result = await OpenIMManager.callPromise(jsSearchLocalMessages(opID.toJS, param.toJS));
    if (result == null) return null as dynamic;
    return SearchResult.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<AdvancedMessage> getAdvancedHistoryMessageList({
    String? conversationID, Message? startMsg,
    GetHistoryViewType viewType = GetHistoryViewType.history,
    int? count, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final opts = jsonEncode({
      'conversationID': conversationID ?? '',
      'startClientMsgID': startMsg?.clientMsgID ?? '',
      'count': count ?? 40,
      'viewType': viewType.rawValue,
    });
    final result = await OpenIMManager.callPromise(jsGetAdvancedHistoryMessageList(opID.toJS, opts.toJS));
    if (result == null) return null as dynamic;
    return AdvancedMessage.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<AdvancedMessage> getAdvancedHistoryMessageListReverse({
    String? conversationID, Message? startMsg,
    GetHistoryViewType viewType = GetHistoryViewType.history,
    int? count, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final opts = jsonEncode({
      'conversationID': conversationID ?? '',
      'startClientMsgID': startMsg?.clientMsgID ?? '',
      'count': count ?? 40,
      'viewType': viewType.rawValue,
    });
    final result = await OpenIMManager.callPromise(jsGetAdvancedHistoryMessageListReverse(opID.toJS, opts.toJS));
    if (result == null) return null as dynamic;
    return AdvancedMessage.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<SearchResult> findMessageList({required List<SearchParams> searchParams, String? operationID}) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsFindMessageList(opID.toJS, jsonEncode(searchParams.map((e) => e.toJson()).toList()).toJS));
    if (result == null) return null as dynamic;
    return SearchResult.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<Message> insertSingleMessageToLocalStorage({
    String? receiverID, String? senderID, Message? message, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsInsertSingleMessageToLocalStorage(
      opID.toJS,
      jsonEncode(message?.toJson()).toJS,
      (receiverID ?? '').toJS,
      (senderID ?? '').toJS,
    ));
    if (result == null) return null as dynamic;
    return Message.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<Message> insertGroupMessageToLocalStorage({
    String? groupID, String? senderID, Message? message, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsInsertGroupMessageToLocalStorage(
      opID.toJS,
      jsonEncode(message?.toJson()).toJS,
      (groupID ?? '').toJS,
      (senderID ?? '').toJS,
    ));
    if (result == null) return null as dynamic;
    return Message.fromJson(jsonDecode(OpenIMManager.ensureResultString(result)));
  }

  Future<void> setMessageLocalEx({
    required String conversationID, required String clientMsgID,
    required String localEx, String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsSetMessageLocalEx(opID.toJS, conversationID.toJS, clientMsgID.toJS, localEx.toJS));
  }

  Future<void> typingStatusUpdate({
    required String userID,
    required String msgTip,
    String? operationID,
  }) async {
    final opID = IMUtils.checkOperationID(operationID);
    final result = await OpenIMManager.callPromise(jsTypingStatusUpdate(opID.toJS, userID.toJS, msgTip.toJS));
  }
}
