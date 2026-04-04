// ignore_for_file: file_names

part of '../../flutter_openim_sdk_ffi_native.dart';

void _method(_PortModel msg, FlutterOpenimSdkFfiBindings bindings) {
  switch (msg.method) {
    case _PortMethod.login:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      final token = (msg.data['token'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.Login(operationID, userID, token);
      calloc.free(operationID);
      calloc.free(userID);
      calloc.free(token);
      break;
    case _PortMethod.version:
      String version = bindings.GetSdkVersion().cast<Utf8>().toDartString();
      msg.sendPort?.send(_PortResult(data: version));
      break;
    case _PortMethod.getLoginStatus:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      int status = bindings.GetLoginStatus(operationID);
      msg.sendPort?.send(_PortResult(data: status));
      calloc.free(operationID);
      break;
    case _PortMethod.getUsersInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uidList = (jsonEncode(msg.data['userIDList'] as List<String>)).toNativeUtf8().cast<ffi.Char>();
      bindings.GetUsersInfo(operationID, uidList);
      calloc.free(operationID);
      calloc.free(uidList);
      break;
    case _PortMethod.subscribeUsersStatus:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDs = (jsonEncode(msg.data['userIDs'] as List<String>)).toNativeUtf8().cast<ffi.Char>();
      bindings.SubscribeUsersStatus(operationID, userIDs);
      calloc.free(operationID);
      calloc.free(userIDs);
      break;
    case _PortMethod.getSubscribeUsersStatus:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetSubscribeUsersStatus(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.unsubscribeUsersStatus:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDs = (jsonEncode(msg.data['userIDs'] as List<String>)).toNativeUtf8().cast<ffi.Char>();
      bindings.UnsubscribeUsersStatus(operationID, userIDs);
      calloc.free(operationID);
      calloc.free(userIDs);
      break;
    case _PortMethod.logout:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.Logout(operationID);
      calloc.free(operationID);
      break;

    case _PortMethod.uploadFile:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uuid = (msg.data['uuid'] as String).toNativeUtf8().cast<ffi.Char>();
      final req = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.UploadFile(operationID, req, uuid);
      calloc.free(operationID);
      calloc.free(req);
      calloc.free(uuid);
      break;
    case _PortMethod.uploadLogs:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uuid = (msg.data['uuid'] as String).toNativeUtf8().cast<ffi.Char>();
      final ex = (msg.data['ex'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.UploadLogs(operationID, msg.data['line'], ex, uuid);
      calloc.free(operationID);
      calloc.free(ex);
      calloc.free(uuid);
      break;
    case _PortMethod.logs:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final file = (msg.data['file'] as String).toNativeUtf8().cast<ffi.Char>();
      final msgs = (msg.data['msgs'] as String).toNativeUtf8().cast<ffi.Char>();
      final err = (msg.data['err'] as String).toNativeUtf8().cast<ffi.Char>();
      final keyAndValue = (msg.data['keyAndValue'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.Logs(operationID, msg.data['logLevel'], file, msg.data['line'], msgs, err, keyAndValue);
      calloc.free(operationID);
      calloc.free(file);
      calloc.free(msgs);
      calloc.free(err);
      calloc.free(keyAndValue);
      break;
    case _PortMethod.getSelfUserInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetSelfUserInfo(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.getAllConversationList:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetAllConversationList(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.getConversationIDBySessionType:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final sourceID = (msg.data['sourceID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetConversationIDBySessionType(operationID, sourceID, msg.data['sessionType']);
      calloc.free(operationID);
      calloc.free(sourceID);
      break;
    case _PortMethod.getMultipleConversation:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationIDList = jsonEncode(msg.data['conversationIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetMultipleConversation(operationID, conversationIDList);
      calloc.free(operationID);
      break;
    case _PortMethod.getOneConversation:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final sourceID = (msg.data['sourceID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetOneConversation(operationID, msg.data['sessionType'], sourceID);
      calloc.free(operationID);
      calloc.free(sourceID);
      break;
    case _PortMethod.getConversationListSplit:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetConversationListSplit(operationID, msg.data['offset'], msg.data['count']);
      calloc.free(operationID);
      break;
    case _PortMethod.revokeMessage:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final clientMsgID = (msg.data['clientMsgID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.RevokeMessage(operationID, conversationID, clientMsgID);
      calloc.free(operationID);
      calloc.free(conversationID);
      calloc.free(clientMsgID);
      break;
    case _PortMethod.sendMessage:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final message = jsonEncode(msg.data['message']).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupID = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final offlinePushInfo = jsonEncode(msg.data['offlinePushInfo']).toNativeUtf8().cast<ffi.Char>();
      final clientMsgID = jsonEncode(msg.data['message']['clientMsgID']).toNativeUtf8().cast<ffi.Char>();
      bindings.SendMessage(operationID, message, userID, groupID, offlinePushInfo);
      calloc.free(operationID);
      calloc.free(message);
      calloc.free(userID);
      calloc.free(groupID);
      calloc.free(offlinePushInfo);
      calloc.free(clientMsgID);
      break;
    case _PortMethod.sendMessageNotOss:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final message = jsonEncode(msg.data['message']).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupID = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final offlinePushInfo = jsonEncode(msg.data['offlinePushInfo']).toNativeUtf8().cast<ffi.Char>();
      final clientMsgID = jsonEncode(msg.data['message']['clientMsgID']).toNativeUtf8().cast<ffi.Char>();
      bindings.SendMessageNotOss(operationID, message, userID, groupID, offlinePushInfo);
      calloc.free(operationID);
      calloc.free(message);
      calloc.free(userID);
      calloc.free(groupID);
      calloc.free(offlinePushInfo);
      calloc.free(clientMsgID);
      break;
    case _PortMethod.insertSingleMessageToLocalStorage:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final message = jsonEncode(msg.data['message']).toNativeUtf8().cast<ffi.Char>();
      final receiverID = (msg.data['receiverID'] as String).toNativeUtf8().cast<ffi.Char>();
      final senderID = (msg.data['senderID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.InsertSingleMessageToLocalStorage(operationID, message, receiverID, senderID);
      calloc.free(operationID);
      calloc.free(message);
      calloc.free(receiverID);
      calloc.free(senderID);
      break;

    case _PortMethod.setMessageLocalEx:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final clientMsgID = (msg.data['clientMsgID'] as String).toNativeUtf8().cast<ffi.Char>();
      final localEx = (msg.data['localEx'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.SetMessageLocalEx(operationID, conversationID, clientMsgID, localEx);
      calloc.free(operationID);
      calloc.free(clientMsgID);
      calloc.free(localEx);
      break;

    case _PortMethod.getGroupMembersInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDList = jsonEncode(msg.data['userIDList']).toNativeUtf8().cast<ffi.Char>();
      final groupID = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetSpecifiedGroupMembersInfo(operationID, groupID, userIDList);
      calloc.free(operationID);
      calloc.free(groupID);
      calloc.free(userIDList);
      break;

    case _PortMethod.setGroupInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupInfo = jsonEncode(msg.data['groupInfo']).toNativeUtf8().cast<ffi.Char>();
      bindings.SetGroupInfo(operationID, groupInfo);
      calloc.free(operationID);
      calloc.free(groupInfo);
      break;

    case _PortMethod.getGroupApplicationListAsRecipient:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final req = jsonEncode(msg.data['req']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetGroupApplicationListAsRecipient(operationID, req);
      calloc.free(operationID);
      calloc.free(req);
      break;
    case _PortMethod.getGroupApplicationListAsApplicant:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final req = jsonEncode(msg.data['req']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetGroupApplicationListAsApplicant(operationID, req);
      calloc.free(operationID);
      calloc.free(req);
      break;

    case _PortMethod.insertGroupMessageToLocalStorage:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final message = jsonEncode(msg.data['message']).toNativeUtf8().cast<ffi.Char>();
      final groupID = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final senderID = (msg.data['senderID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.InsertGroupMessageToLocalStorage(operationID, message, groupID, senderID);
      calloc.free(operationID);
      calloc.free(message);
      calloc.free(groupID);
      calloc.free(senderID);
      break;
    case _PortMethod.markMessageAsReadByMsgID:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final messageIDList = jsonEncode(msg.data['messageIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.MarkMessagesAsReadByMsgID(operationID, conversationID, messageIDList);
      calloc.free(operationID);
      calloc.free(conversationID);
      calloc.free(messageIDList);
      break;
    case _PortMethod.typingStatusUpdate:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      final msgTip = (msg.data['msgTip'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.TypingStatusUpdate(operationID, userID, msgTip);
      calloc.free(operationID);
      calloc.free(userID);
      calloc.free(msgTip);
      break;
    case _PortMethod.createTextMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final text = (msg.data['text'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateTextMessage(operationID, text);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(text);
      break;

    case _PortMethod.createTextAtMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final text = (msg.data['text'] as String).toNativeUtf8().cast<ffi.Char>();
      final atUserIDList = jsonEncode(msg.data['atUserIDList']).toNativeUtf8().cast<ffi.Char>();
      final atUserInfoList = jsonEncode(msg.data['atUserInfoList']).toNativeUtf8().cast<ffi.Char>();
      final quoteMessage = (msg.data['quoteMessage'] == null ? '' : jsonEncode(msg.data['quoteMessage'])).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateTextAtMessage(operationID, text, atUserIDList, atUserInfoList, quoteMessage);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(text);
      calloc.free(atUserIDList);
      calloc.free(atUserInfoList);
      calloc.free(quoteMessage);
      break;
    case _PortMethod.createImageMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final imagePath = (msg.data['imagePath'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateImageMessage(operationID, imagePath);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(imagePath);
      break;
    case _PortMethod.createImageMessageFromFullPath:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final imagePath = (msg.data['imagePath'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateImageMessageFromFullPath(operationID, imagePath);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(imagePath);
      break;
    case _PortMethod.createSoundMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final soundPath = (msg.data['soundPath'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateSoundMessage(operationID, soundPath, msg.data['duration']);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(soundPath);
      break;
    case _PortMethod.createSoundMessageFromFullPath:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final soundPath = (msg.data['soundPath'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateSoundMessageFromFullPath(operationID, soundPath, msg.data['duration']);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(soundPath);
      break;
    case _PortMethod.createVideoMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final videoPath = (msg.data['videoPath'] as String).toNativeUtf8().cast<ffi.Char>();
      final videoType = (msg.data['videoType'] as String).toNativeUtf8().cast<ffi.Char>();
      final snapshotPath = (msg.data['snapshotPath'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateVideoMessage(operationID, videoPath, videoType, msg.data['duration'], snapshotPath);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(videoPath);
      calloc.free(videoType);
      calloc.free(snapshotPath);
      break;
    case _PortMethod.createVideoMessageFromFullPath:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final videoPath = (msg.data['videoPath'] as String).toNativeUtf8().cast<ffi.Char>();
      final videoType = (msg.data['videoType'] as String).toNativeUtf8().cast<ffi.Char>();
      final snapshotPath = (msg.data['snapshotPath'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateVideoMessageFromFullPath(operationID, videoPath, videoType, msg.data['duration'], snapshotPath);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(videoPath);
      calloc.free(videoType);
      calloc.free(snapshotPath);
      break;
    case _PortMethod.createFileMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final filePath = (msg.data['filePath'] as String).toNativeUtf8().cast<ffi.Char>();
      final fileName = (msg.data['fileName'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateFileMessage(operationID, filePath, fileName);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(filePath);
      calloc.free(fileName);
      break;
    case _PortMethod.createFileMessageFromFullPath:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final filePath = (msg.data['filePath'] as String).toNativeUtf8().cast<ffi.Char>();
      final fileName = (msg.data['fileName'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateFileMessageFromFullPath(operationID, filePath, fileName);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(filePath);
      calloc.free(fileName);
      break;
    case _PortMethod.createMergerMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final messageList = jsonEncode(msg.data['messageList']).toNativeUtf8().cast<ffi.Char>();
      final title = (msg.data['title'] as String).toNativeUtf8().cast<ffi.Char>();
      final summaryList = jsonEncode(msg.data['summaryList']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateMergerMessage(operationID, messageList, title, summaryList);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(messageList);
      calloc.free(title);
      calloc.free(summaryList);
      break;
    case _PortMethod.deleteMessage:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final clientMsgID = (msg.data['clientMsgID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.DeleteMessage(operationID, conversationID, clientMsgID);
      calloc.free(operationID);
      calloc.free(conversationID);
      calloc.free(clientMsgID);
    case _PortMethod.deleteMessageFromLocalStorage:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final clientMsgID = (msg.data['clientMsgID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.DeleteMessageFromLocalStorage(operationID, conversationID, clientMsgID);
      calloc.free(operationID);
      calloc.free(conversationID);
      calloc.free(clientMsgID);
    case _PortMethod.isJoinGroup:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupID = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.IsJoinGroup(operationID, groupID);
      calloc.free(operationID);
      calloc.free(groupID);
    case _PortMethod.createForwardMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final message = jsonEncode(msg.data['message']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateForwardMessage(operationID, message);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(message);
      break;
    case _PortMethod.createLocationMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final description = (msg.data['description'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateLocationMessage(operationID, description, msg.data['longitude'], msg.data['latitude']);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(description);
      break;
    case _PortMethod.createCustomMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final data = (msg.data['data'] as String).toNativeUtf8().cast<ffi.Char>();
      final extension = (msg.data['extension'] as String).toNativeUtf8().cast<ffi.Char>();
      final description = (msg.data['description'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateCustomMessage(operationID, data, extension, description);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(data);
      calloc.free(extension);
      calloc.free(description);
      break;
    case _PortMethod.createQuoteMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final text = (msg.data['text'] as String).toNativeUtf8().cast<ffi.Char>();
      final message = jsonEncode(msg.data['quoteMsg']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateQuoteMessage(operationID, text, message);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(text);
      calloc.free(message);
      break;
    case _PortMethod.createCardMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final data = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateCardMessage(operationID, data);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(data);
      break;
    case _PortMethod.createFaceMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final data = (msg.data['data'] as String).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateFaceMessage(operationID, msg.data['index'], data);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(data);
      break;
    case _PortMethod.searchLocalMessages:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final searchParam = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.SearchLocalMessages(operationID, searchParam);
      calloc.free(operationID);
      calloc.free(searchParam);
      break;
    case _PortMethod.deleteAllMsgFromLocal:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.DeleteAllMsgFromLocal(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.deleteAllMsgFromLocalAndSvr:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.DeleteAllMsgFromLocalAndSvr(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.findMessageList:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final searchParams = jsonEncode(msg.data['searchParams']).toNativeUtf8().cast<ffi.Char>();
      bindings.FindMessageList(operationID, searchParams);
      calloc.free(operationID);
      calloc.free(searchParams);
      break;
    case _PortMethod.createAdvancedTextMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final text = (msg.data['text'] as String).toNativeUtf8().cast<ffi.Char>();
      final messageEntityList = jsonEncode(msg.data['richMessageInfoList']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateAdvancedTextMessage(operationID, text, messageEntityList);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(text);
      calloc.free(messageEntityList);
      break;
    case _PortMethod.createAdvancedQuoteMessage:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final text = (msg.data['text'] as String).toNativeUtf8().cast<ffi.Char>();
      final message = jsonEncode(msg.data['message']).toNativeUtf8().cast<ffi.Char>();
      final messageEntityList = jsonEncode(msg.data['richMessageInfoList']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateAdvancedQuoteMessage(operationID, text, message, messageEntityList);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(text);
      calloc.free(message);
      calloc.free(messageEntityList);
      break;
    case _PortMethod.createImageMessageByURL:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final sourcePath = jsonEncode(msg.data['sourcePath']).toNativeUtf8().cast<ffi.Char>();
      final sourcePicture = jsonEncode(msg.data['sourcePicture']).toNativeUtf8().cast<ffi.Char>();
      final bigPicture = jsonEncode(msg.data['bigPicture']).toNativeUtf8().cast<ffi.Char>();
      final snapshotPicture = jsonEncode(msg.data['snapshotPicture']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateImageMessageByURL(operationID, sourcePath, sourcePicture, bigPicture, snapshotPicture);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(sourcePath);
      calloc.free(sourcePicture);
      calloc.free(bigPicture);
      calloc.free(snapshotPicture);
      break;
    case _PortMethod.createSoundMessageByURL:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final soundElem = jsonEncode(msg.data['soundElem']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateSoundMessageByURL(operationID, soundElem);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(soundElem);
      break;
    case _PortMethod.createVideoMessageByURL:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final videoElem = jsonEncode(msg.data['videoElem']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateVideoMessageByURL(operationID, videoElem);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(videoElem);
      break;
    case _PortMethod.createFileMessageByURL:
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final fileElem = jsonEncode(msg.data['fileElem']).toNativeUtf8().cast<ffi.Char>();
      final newMsg = bindings.CreateFileMessageByURL(operationID, fileElem);
      msg.sendPort?.send(_PortResult(data: IMUtils.toObj(newMsg.cast<Utf8>().toDartString(), (v) => Message.fromJson(v))));
      calloc.free(operationID);
      calloc.free(fileElem);
      break;
    case _PortMethod.getAdvancedHistoryMessageList:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final getMessageOptions = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.GetAdvancedHistoryMessageList(operationID, getMessageOptions);
      calloc.free(operationID);
      calloc.free(getMessageOptions);
      break;
    case _PortMethod.getAdvancedHistoryMessageListReverse:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final getMessageOptions = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.GetAdvancedHistoryMessageListReverse(operationID, getMessageOptions);
      calloc.free(operationID);
      calloc.free(getMessageOptions);
      break;
    case _PortMethod.setConversation:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final req = jsonEncode(msg.data['req']).toNativeUtf8().cast<ffi.Char>();
      bindings.SetConversation(operationID, conversationID, req);
      calloc.free(operationID);
      calloc.free(conversationID);
      calloc.free(req);
      break;
    case _PortMethod.hideConversation:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.HideConversation(operationID, conversationID);
      calloc.free(operationID);
      calloc.free(conversationID);
      break;

    case _PortMethod.changeInputStates:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.ChangeInputStates(operationID, conversationID, msg.data['focus']);
      calloc.free(operationID);
      calloc.free(conversationID);
      break;
    case _PortMethod.getInputStates:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetInputStates(operationID, conversationID, userID);
      calloc.free(operationID);
      calloc.free(conversationID);
      calloc.free(userID);
      break;
    case _PortMethod.clearConversationAndDeleteAllMsg:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.ClearConversationAndDeleteAllMsg(operationID, conversationID);
      calloc.free(operationID);
      calloc.free(conversationID);
      break;

    case _PortMethod.hideAllConversations:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.HideAllConversations(operationID);
      calloc.free(operationID);
      break;

    case _PortMethod.setConversationDraft:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final draftText = (msg.data['draftText'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.SetConversationDraft(operationID, conversationID, draftText);
      calloc.free(operationID);
      calloc.free(conversationID);
      calloc.free(draftText);
      break;

    case _PortMethod.getTotalUnreadMsgCount:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetTotalUnreadMsgCount(operationID);
      calloc.free(operationID);
      break;

    // case _PortMethod.deleteAllConversationFromLocal:
    //   OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
    //   final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
    //   bindings.DeleteAllConversationFromLocal(operationID);
    //   calloc.free(operationID);
    //   break;

    case _PortMethod.markConversationMessageAsRead:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.MarkConversationMessageAsRead(operationID, conversationID);
      calloc.free(operationID);
      break;

    case _PortMethod.deleteConversationAndDeleteAllMsg:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final conversationID = (msg.data['conversationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.DeleteConversationAndDeleteAllMsg(operationID, conversationID);
      calloc.free(operationID);
      break;

    case _PortMethod.addFriend:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDReqMsg = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.AddFriend(operationID, userIDReqMsg);
      calloc.free(operationID);
      calloc.free(userIDReqMsg);
      break;
    case _PortMethod.getFriendApplicationListAsApplicant:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final req = jsonEncode(msg.data['req']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetFriendApplicationListAsApplicant(operationID, req);
      calloc.free(operationID);
      calloc.free(req);
      break;
    case _PortMethod.getFriendApplicationListAsRecipient:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final req = jsonEncode(msg.data['req']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetFriendApplicationListAsRecipient(operationID, req);
      calloc.free(operationID);
      calloc.free(req);
      break;
    case _PortMethod.getFriendList:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetFriendList(operationID, msg.data['filterBlack']);
      calloc.free(operationID);
      break;
    case _PortMethod.getFriendListPage:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetFriendListPage(operationID, msg.data['offset'], msg.data['count'], msg.data['filterBlack']);
      calloc.free(operationID);
      break;
    case _PortMethod.getFriendsInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDList = jsonEncode(msg.data['userIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetSpecifiedFriendsInfo(operationID, userIDList, msg.data['filterBlack']);
      calloc.free(operationID);
      calloc.free(userIDList);
      break;
    case _PortMethod.addBlacklist:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      final ex = (msg.data['ex'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.AddBlack(operationID, userID, ex);
      calloc.free(operationID);
      calloc.free(userID);
      calloc.free(ex);
      break;
    case _PortMethod.getBlackList:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetBlackList(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.removeBlacklist:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.RemoveBlack(operationID, userID);
      calloc.free(operationID);
      calloc.free(userID);
      break;
    case _PortMethod.checkFriend:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDList = jsonEncode(msg.data['userIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.CheckFriend(operationID, userIDList);
      calloc.free(operationID);
      calloc.free(userIDList);
      break;

    case _PortMethod.updateFriends:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final req = jsonEncode(msg.data['req']).toNativeUtf8().cast<ffi.Char>();
      bindings.UpdateFriends(operationID, req);
      calloc.free(operationID);
      calloc.free(req);
      break;

    case _PortMethod.deleteFriend:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userID = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.DeleteFriend(operationID, userID);
      calloc.free(operationID);
      calloc.free(userID);
      break;
    case _PortMethod.acceptFriendApplication:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final ops = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.AcceptFriendApplication(operationID, ops);
      calloc.free(operationID);
      calloc.free(ops);
      break;
    case _PortMethod.refuseFriendApplication:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final ops = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.RefuseFriendApplication(operationID, ops);
      calloc.free(operationID);
      calloc.free(ops);
      break;
    case _PortMethod.searchFriends:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final ops = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.SearchFriends(operationID, ops);
      calloc.free(operationID);
      calloc.free(ops);
      break;

    // case _PortMethod.signalingUpdateMeetingInfo:
    //   final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
    //   final roomID = (msg.data['roomID'] as String).toNativeUtf8().cast<ffi.Char>();
    //   bindings.SignalingUpdateMeetingInfo(operationID, roomID);
    //   OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
    //   calloc.free(operationID);
    //   calloc.free(roomID);
    //   break;
    case _PortMethod.inviteUserToGroup:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupId = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final reason = (msg.data['reason'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDList = jsonEncode(msg.data['userIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.InviteUserToGroup(operationID, groupId, reason, userIDList);
      calloc.free(operationID);
      calloc.free(groupId);
      calloc.free(reason);
      calloc.free(userIDList);
      break;
    case _PortMethod.kickGroupMember:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupId = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final reason = (msg.data['reason'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDList = jsonEncode(msg.data['userIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.KickGroupMember(operationID, groupId, reason, userIDList);
      calloc.free(operationID);
      calloc.free(groupId);
      calloc.free(reason);
      calloc.free(userIDList);
      break;
    case _PortMethod.getGroupsInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupIDList = jsonEncode(msg.data['groupIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetSpecifiedGroupsInfo(operationID, groupIDList);
      calloc.free(operationID);
      calloc.free(groupIDList);
      break;
    case _PortMethod.getGroupMemberList:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupId = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetGroupMemberList(operationID, groupId, msg.data['filter'], msg.data['offset'], msg.data['count']);
      calloc.free(operationID);
      calloc.free(groupId);
      break;
    case _PortMethod.getJoinedGroupList:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetJoinedGroupList(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.createGroup:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gInfo = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.CreateGroup(operationID, gInfo);
      calloc.free(operationID);
      calloc.free(gInfo);
      break;

    case _PortMethod.joinGroup:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final reason = (msg.data['reason'] as String).toNativeUtf8().cast<ffi.Char>();
      final ex = (msg.data['ex'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.JoinGroup(operationID, gid, reason, msg.data['joinSource'], ex);
      calloc.free(operationID);
      calloc.free(gid);
      calloc.free(reason);
      calloc.free(ex);
      break;
    case _PortMethod.quitGroup:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.QuitGroup(operationID, gid);
      calloc.free(operationID);
      calloc.free(gid);
      break;
    case _PortMethod.transferGroupOwner:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uid = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.TransferGroupOwner(operationID, gid, uid);
      calloc.free(operationID);
      calloc.free(gid);
      calloc.free(uid);
      break;

    case _PortMethod.acceptGroupApplication:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uid = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      final handleMsg = (msg.data['handleMsg'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.AcceptGroupApplication(operationID, gid, uid, handleMsg);
      calloc.free(operationID);
      calloc.free(gid);
      calloc.free(uid);
      calloc.free(handleMsg);
      break;
    case _PortMethod.refuseGroupApplication:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uid = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      final handleMsg = (msg.data['handleMsg'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.RefuseGroupApplication(operationID, gid, uid, handleMsg);
      calloc.free(operationID);
      calloc.free(gid);
      calloc.free(uid);
      calloc.free(handleMsg);
      break;
    case _PortMethod.dismissGroup:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.DismissGroup(operationID, gid);
      calloc.free(operationID);
      calloc.free(gid);
      break;
    case _PortMethod.getUsersInGroup:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupID = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userIDs = jsonEncode(msg.data['userIDs']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetUsersInGroup(operationID, groupID, userIDs);
      calloc.free(operationID);
      calloc.free(groupID);
      calloc.free(userIDs);
      break;
    case _PortMethod.changeGroupMute:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.ChangeGroupMute(operationID, gid, msg.data['mute']);
      calloc.free(operationID);
      calloc.free(gid);
      break;
    case _PortMethod.changeGroupMemberMute:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uid = (msg.data['userID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.ChangeGroupMemberMute(operationID, gid, uid, msg.data['seconds']);
      calloc.free(operationID);
      calloc.free(gid);
      calloc.free(uid);
      break;

    case _PortMethod.searchGroups:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final ops = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.SearchGroups(operationID, ops);
      calloc.free(operationID);
      calloc.free(ops);
      break;

    case _PortMethod.getGroupMemberListByJoinTimeFilter:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      final uIds = jsonEncode(msg.data['excludeUserIDList']).toNativeUtf8().cast<ffi.Char>();
      bindings.GetGroupMemberListByJoinTimeFilter(operationID, gid, msg.data['offset'], msg.data['count'], msg.data['joinTimeBegin'], msg.data['joinTimeEnd'], uIds);
      calloc.free(operationID);
      calloc.free(gid);
      calloc.free(uIds);
      break;

    case _PortMethod.getGroupMemberOwnerAndAdmin:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final gid = (msg.data['groupID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.GetGroupMemberOwnerAndAdmin(operationID, gid);
      calloc.free(operationID);
      calloc.free(gid);
      break;

    case _PortMethod.searchGroupMembers:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final searchParam = jsonEncode(msg.data['searchParam']).toNativeUtf8().cast<ffi.Char>();
      bindings.SearchGroupMembers(operationID, searchParam);
      calloc.free(operationID);
      calloc.free(searchParam);
      break;
    case _PortMethod.setGroupMemberInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final groupMemberInfo = jsonEncode(msg.data['info']).toNativeUtf8().cast<ffi.Char>();
      bindings.SetGroupMemberInfo(operationID, groupMemberInfo);
      calloc.free(operationID);
      calloc.free(groupMemberInfo);
      break;
    case _PortMethod.networkStatusChanged:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.NetworkStatusChanged(operationID);
      calloc.free(operationID);
      break;
    case _PortMethod.setAppBackgroundStatus:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.SetAppBackgroundStatus(operationID, msg.data['isBackground']);
      calloc.free(operationID);
      break;
    case _PortMethod.updateFcmToken:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final fcmToken = (msg.data['fcmToken'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.UpdateFcmToken(operationID, fcmToken, msg.data['expireTime']);
      calloc.free(operationID);
      calloc.free(fcmToken);
      break;

    case _PortMethod.setSelfInfo:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      final userInfo = jsonEncode(msg.data).toNativeUtf8().cast<ffi.Char>();
      bindings.SetSelfInfo(operationID, userInfo);
      calloc.free(operationID);
      calloc.free(userInfo);
      break;
    case _PortMethod.setAppBadge:
      OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
      final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
      bindings.SetAppBadge(operationID, msg.data['unreadCount']);
      calloc.free(operationID);
      break;

    //  case _PortMethod.unInitSDK:
    // final operationID = (msg.data['operationID'] as String).toNativeUtf8().cast<ffi.Char>();
    // bindings.(operationID);
    // OpenIMManager._sendPortMap[msg.data['operationID']] = msg.sendPort!;
    // calloc.free(operationID);
    // break;
  }
}
