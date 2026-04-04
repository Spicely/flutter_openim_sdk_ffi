part of '../../flutter_openim_sdk_ffi_native.dart';

class MessageManager {
  MessageManager();

  /// 发送消息
  /// [message] 消息体
  /// [userID] 接收消息的用户id
  /// [groupID] 接收消息的组id
  /// [offlinePushInfo] 离线消息显示内容
  Future<Message> sendMessage({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    bool isOnlineOnly = false,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.sendMessage,
      data: {
        'message': message.toJson(),
        'offlinePushInfo': offlinePushInfo.toJson(),
        'userID': userID ?? '',
        'isOnlineOnly': isOnlineOnly,
        'groupID': groupID ?? '',
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 删除本地消息
  Future<void> deleteMessageFromLocalStorage({required String conversationID, required String clientMsgID, String? operationID}) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.deleteMessageFromLocalStorage,
      data: {
        'conversationID': conversationID,
        'clientMsgID': clientMsgID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 删除本地跟服务器的指定的消息
  /// [message] 被删除的消息
  Future<void> deleteMessageFromLocalAndSvr({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.deleteMessage,
      data: {
        'conversationID': conversationID,
        'clientMsgID': clientMsgID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 删除本地所有聊天记录
  Future<void> deleteAllMsgFromLocal({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.deleteAllMsgFromLocal,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 插入单聊消息到本地
  /// [receiverID] 接收者id
  /// [senderID] 发送者id
  /// [message] 消息体
  Future<Message> insertSingleMessageToLocalStorage({
    String? receiverID,
    String? senderID,
    Message? message,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.insertSingleMessageToLocalStorage,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'message': message?.toJson(),
        'receiverID': receiverID ?? '',
        'senderID': senderID ?? '',
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 删除本地跟服务器所有聊天记录
  Future<void> deleteAllMsgFromLocalAndSvr({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.deleteAllMsgFromLocalAndSvr,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 插入群聊消息到本地
  /// [groupID] 群id
  /// [senderID] 发送者id
  /// [message] 消息体
  Future<Message> insertGroupMessageToLocalStorage({
    String? groupID,
    String? senderID,
    Message? message,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.insertGroupMessageToLocalStorage,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'message': message?.toJson(),
        'groupID': groupID,
        'senderID': senderID,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建文本消息
  Future<Message> createTextMessage({
    required String text,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createTextMessage,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'text': text,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建@消息
  /// [text] 输入内容
  ///
  /// [atUserIDList] 被@到的userID集合
  ///
  /// [atUserInfoList] userID跟nickname映射关系，用在界面显示时将id替换为nickname
  ///
  /// [quoteMessage] 引用消息（被回复的消息）
  Future<Message> createTextAtMessage({
    required String text,
    required List<String> atUserIDList,
    List<AtUserInfo> atUserInfoList = const [],
    Message? quoteMessage,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createTextAtMessage,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'text': text,
        'atUserIDList': atUserIDList,
        'atUserInfoList': atUserInfoList.map((e) => e.toJson()).toList(),
        'quoteMessage': quoteMessage?.toJson(),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建图片消息
  /// [imagePath] 路径
  Future<Message> createImageMessage({
    required String imagePath,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createImageMessage,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'imagePath': imagePath,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建图片消息
  ///
  /// [imagePath] 路径
  Future<Message> createImageMessageFromFullPath({
    required String imagePath,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createImageMessageFromFullPath,
      data: {
        'imagePath': imagePath,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建语音消息
  ///
  /// [soundPath] 路径
  ///
  /// [duration] 时长s
  Future<Message> createSoundMessage({
    required String soundPath,
    required int duration,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createSoundMessage,
      data: {
        'soundPath': soundPath,
        'duration': duration,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建语音消息
  ///
  /// [soundPath] 路径
  ///
  /// [duration] 时长s
  Future<Message> createSoundMessageFromFullPath({
    required String soundPath,
    required int duration,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createSoundMessageFromFullPath,
      data: {
        'soundPath': soundPath,
        'duration': duration,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建视频消息
  ///
  /// [videoPath] 路径
  ///
  /// [videoType] 视频mime类型
  ///
  /// [duration] 时长s
  ///
  /// [snapshotPath] 默认站位图路径
  Future<Message> createVideoMessage({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createVideoMessage,
      data: {
        'videoPath': videoPath,
        'videoType': videoType,
        'duration': duration,
        'snapshotPath': snapshotPath,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建视频消息
  ///
  /// [videoPath] 路径
  ///
  /// [videoType] 视频mime类型
  ///
  /// [duration] 时长s
  ///
  /// [snapshotPath] 默认站位图路径
  Future<Message> createVideoMessageFromFullPath({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createVideoMessageFromFullPath,
      data: {
        'videoPath': videoPath,
        'videoType': videoType,
        'duration': duration,
        'snapshotPath': snapshotPath,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建文件消息
  ///
  /// [filePath] 路径
  ///
  /// [fileName] 文件名
  Future<Message> createFileMessage({
    required String filePath,
    required String fileName,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createFileMessage,
      data: {
        'filePath': filePath,
        'fileName': fileName,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 创建文件消息
  ///
  /// [filePath] 路径
  ///
  /// [fileName] 文件名
  Future<Message> createFileMessageFromFullPath({
    required String filePath,
    required String fileName,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createFileMessageFromFullPath,
      data: {
        'filePath': filePath,
        'fileName': fileName,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 创建合并消息
  ///
  /// [messageList] 被选中的消息
  ///
  /// [title] 摘要标题
  ///
  /// [summaryList] 摘要内容
  Future<Message> createMergerMessage({
    required List<Message> messageList,
    required String title,
    required List<String> summaryList,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createMergerMessage,
      data: {
        'messageList': messageList.map((e) => e.toJson()).toList(),
        'title': title,
        'summaryList': summaryList,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建转发消息
  ///
  /// [message] 被转发的消息
  Future<Message> createForwardMessage({
    required Message message,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createForwardMessage,
      data: {
        'message': message.toJson(),
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建位置消息
  ///
  /// [latitude] 纬度
  ///
  /// [longitude] 经度
  ///
  /// [description] 自定义描述信息
  Future<Message> createLocationMessage({
    required double latitude,
    required double longitude,
    required String description,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createLocationMessage,
      data: {
        'latitude': latitude,
        'longitude': longitude,
        'description': description,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建自定义消息
  ///
  /// [data] 自定义数据
  ///
  /// [extension] 自定义扩展内容
  ///
  /// [description] 自定义描述内容
  Future<Message> createCustomMessage({
    required String data,
    required String extension,
    required String description,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createCustomMessage,
      data: {
        'data': data,
        'extension': extension,
        'description': description,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建引用消息
  ///
  /// [text] 回复的内容
  ///
  /// [quoteMsg] 被回复的消息
  Future<Message> createQuoteMessage({
    required String text,
    required Message quoteMsg,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createQuoteMessage,
      data: {
        'text': text,
        'quoteMsg': quoteMsg.toJson(),
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建卡片消息
  Future<Message> createCardMessage({
    required String userID,
    required String nickname,
    String? faceURL,
    String? ex,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createCardMessage,
      data: {
        'userID': userID,
        'nickname': nickname,
        'faceURL': faceURL ?? '',
        'ex': ex ?? '',
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建自定义表情消息
  ///
  /// [index] 位置表情，根据index匹配
  ///
  /// [data] url表情，直接使用url显示
  Future<Message> createFaceMessage({
    int index = -1,
    String? data,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createFaceMessage,
      data: {
        'index': index,
        'data': data ?? '',
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 搜索消息
  ///
  /// [conversationID] 根据会话查询，如果是全局搜索传null
  ///
  /// [keywordList] 搜索关键词列表，目前仅支持一个关键词搜索
  ///
  /// [keywordListMatchType] 关键词匹配模式，1代表与，2代表或，暂时未用
  ///
  /// [senderUserIDList] 指定消息发送的uid列表 暂时未用
  ///
  /// [messageTypeList] 消息类型列表
  ///
  /// [searchTimePosition] 搜索的起始时间点。默认为0即代表从现在开始搜索。UTC 时间戳，单位：秒
  ///
  /// [searchTimePeriod] 从起始时间点开始的过去时间范围，单位秒。默认为0即代表不限制时间范围，传24x60x60代表过去一天
  ///
  /// [pageIndex] 当前页数
  ///
  /// [count] 每页数量
  Future<SearchResult> searchLocalMessages({
    String? conversationID,
    List<String> keywordList = const [],
    int keywordListMatchType = 0,
    List<String> senderUserIDList = const [],
    List<int> messageTypeList = const [],
    int searchTimePosition = 0,
    int searchTimePeriod = 0,
    int pageIndex = 1,
    int count = 40,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.searchLocalMessages,
      data: {
        'conversationID': conversationID,
        'keywordList': keywordList,
        'keywordListMatchType': keywordListMatchType,
        'senderUserIDList': senderUserIDList,
        'messageTypeList': messageTypeList,
        'searchTimePosition': searchTimePosition,
        'searchTimePeriod': searchTimePeriod,
        'pageIndex': pageIndex,
        'count': count,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 撤回一条消息，支持撤回自己发送的消息，或管理员与群主撤回群成员消息
  ///
  /// 撤回后原消息会变成消息类型为2101的撤回通知消息，依然在原位置。
  ///
  /// [conversationID] 会话 ID
  ///
  /// [clientMsgID] 消息 ID
  Future<void> revokeMessage({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.revokeMessage,
      data: {
        'conversationID': conversationID,
        'clientMsgID': clientMsgID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 获取聊天记录(以startMsg为节点，以前的聊天记录)
  ///
  /// [conversationID] 会话id，查询通知时可用
  ///
  /// [startMsg] 从这条消息开始查询[count]条，获取的列表index==length-1为最新消息，所以获取下一页历史记录startMsg=list.first
  ///
  /// [count] 一次拉取的总数
  ///
  /// [lastMinSeq] 第一页消息不用传，获取第二页开始必传 跟[startMsg]一样
  Future<AdvancedMessage> getAdvancedHistoryMessageList({
    String? conversationID,
    Message? startMsg,
    GetHistoryViewType viewType = GetHistoryViewType.history,
    int? count,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getAdvancedHistoryMessageList,
      data: {
        'conversationID': conversationID ?? '',
        'startClientMsgID': startMsg?.clientMsgID ?? '',
        'count': count ?? 40,
        'viewType': viewType.rawValue,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 获取聊天记录(以startMsg为节点，新收到的聊天记录)，用在全局搜索定位某一条消息，然后此条消息后新增的消息
  ///
  /// [conversationID] 会话id，查询通知时可用
  ///
  /// [startMsg] 从这条消息开始查询[count]条，获取的列表index==length-1为最新消息，所以获取下一页历史记录startMsg=list.last
  ///
  /// [count] 一次拉取的总数
  Future<AdvancedMessage> getAdvancedHistoryMessageListReverse({
    String? conversationID,
    Message? startMsg,
    GetHistoryViewType viewType = GetHistoryViewType.history,
    int? count,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getAdvancedHistoryMessageListReverse,
      data: {
        'conversationID': conversationID ?? '',
        'startClientMsgID': startMsg?.clientMsgID ?? '',
        'count': count ?? 40,
        'viewType': viewType.rawValue,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 查找消息详细
  Future<SearchResult> findMessageList({
    required List<SearchParams> searchParams,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.findMessageList,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'searchParams': searchParams.map((e) => e.toJson()).toList(),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 富文本消息
  ///
  /// [text] 输入内容
  ///
  /// [list] 富文本消息具体详细
  Future<Message> createAdvancedTextMessage({
    required String text,
    List<RichMessageInfo> list = const [],
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createAdvancedTextMessage,
      data: {
        'text': text,
        'richMessageInfoList': list.map((e) => e.toJson()).toList(),
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 富文本消息
  ///
  /// [text] 回复的内容
  ///
  /// [quoteMsg] 被回复的消息
  ///
  /// [list] 富文本消息具体详细
  Future<Message> createAdvancedQuoteMessage({
    required String text,
    required Message quoteMsg,
    List<RichMessageInfo> list = const [],
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createAdvancedQuoteMessage,
      data: {
        'text': text,
        'quoteMsg': quoteMsg.toJson(),
        'richMessageInfoList': list.map((e) => e.toJson()).toList(),
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  Future<Message> typingStatusUpdate({
    required String userID,
    String? msgTip,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.typingStatusUpdate,
      data: {
        'userID': userID,
        'msgTip': msgTip ?? '',
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 发送消息
  ///
  /// [message] 消息体 [createImageMessageByURL],[createSoundMessageByURL],[createVideoMessageByURL],[createFileMessageByURL]
  ///
  /// [userID] 接收消息的用户id
  ///
  /// [groupID] 接收消息的组id
  ///
  /// [offlinePushInfo] 离线消息显示内容
  Future<Message> sendMessageNotOss({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    bool isOnlineOnly = false,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.sendMessageNotOss,
      data: {
        'message': message.toJson(),
        'offlinePushInfo': offlinePushInfo.toJson(),
        'userID': userID ?? '',
        'groupID': groupID ?? '',
        'isOnlineOnly': isOnlineOnly,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建图片消息
  Future<Message> createImageMessageByURL({
    required PictureInfo sourcePicture,
    required PictureInfo bigPicture,
    required PictureInfo snapshotPicture,
    String? sourcePath,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createImageMessageByURL,
      data: {
        'sourcePicture': sourcePicture.toJson(),
        'bigPicture': bigPicture.toJson(),
        'snapshotPicture': snapshotPicture.toJson(),
        'sourcePath': sourcePath ?? '',
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建语音消息
  Future<Message> createSoundMessageByURL({
    required SoundElem soundElem,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createSoundMessageByURL,
      data: {
        'soundElem': soundElem.toJson(),
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建视频消息
  Future<Message> createVideoMessageByURL({
    required VideoElem videoElem,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createVideoMessageByURL,
      data: {
        'videoElem': videoElem.toJson(),
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建视频消息
  Future<Message> createFileMessageByURL({
    required FileElem fileElem,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createFileMessageByURL,
      data: {
        'fileElem': fileElem.toJson(),
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 创建视频消息
  Future<Message> setMessageLocalEx({
    required String conversationID,
    required String clientMsgID,
    required String localEx,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setMessageLocalEx,
      data: {
        'conversationID': conversationID,
        'clientMsgID': clientMsgID,
        'localEx': localEx,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }
}
