part of '../../flutter_openim_sdk_ffi_native.dart';

class ConversationManager {
  /// 获取所有会话
  Future<List<ConversationInfo>> getAllConversationList({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getAllConversationList,
      data: {'operationID': IMUtils.checkOperationID(operationID)},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 分页获取会话
  ///
  /// [offset] 开始下标
  ///
  /// [count] 每页数量
  Future<List<ConversationInfo>> getConversationListSplit({
    int offset = 0,
    int count = 20,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getConversationListSplit,
      data: {'operationID': IMUtils.checkOperationID(operationID), 'offset': offset, 'count': count},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 查询会话，如果会话不存在会自动生成一个
  ///
  /// [sourceID] 如果是单聊会话传userID，如果是群聊会话传GroupID
  ///
  /// [sessionType] 参考[ConversationType]
  Future<ConversationInfo> getOneConversation({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getOneConversation,
      data: {
        'sessionType': sessionType,
        'sourceID': sourceID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 根据会话id获取多个会话
  ///
  /// [conversationIDList] 会话id列表
  Future<List<ConversationInfo>> getMultipleConversation({
    required List<String> conversationIDList,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getMultipleConversation,
      data: {
        'conversationIDList': conversationIDList,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 设置会话草稿
  ///
  /// [conversationID] 会话id
  ///
  /// [draftText] 草稿
  Future<void> setConversationDraft({
    required String conversationID,
    required String draftText,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setConversationDraft,
      data: {
        'conversationID': conversationID,
        'draftText': draftText,
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

  Future<void> hideConversation({
    required String conversationID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.hideConversation,
      data: {
        'conversationID': conversationID,
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

  Future<void> hideAllConversation({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.hideAllConversations,
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

  /// 查询会话id
  ///
  /// [sourceID] 如果是单聊值传用户ID，如果是群聊值传组ID
  ///
  /// [sessionType] 参考[ConversationType]
  Future<int> getConversationIDBySessionType({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getConversationIDBySessionType,
      data: {
        'sessionType': sessionType,
        'sourceID': sourceID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 通过会话id删除指定会话
  ///
  /// [conversationID] 被删除的会话的id
  Future<void> deleteConversation({
    required String conversationID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();

    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.deleteConversation,
      data: {'operationID': IMUtils.checkOperationID(operationID), 'conversationID': conversationID},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 获取未读消息总数
  Future<int> getTotalUnreadMsgCount({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getTotalUnreadMsgCount,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 从本地和服务器删除指定会话及会话中的消息
  ///
  /// [conversationID] 会话ID
  Future<void> deleteConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.deleteConversationAndDeleteAllMsg,
      data: {
        'conversationID': conversationID,
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

  Future<void> clearConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.clearConversationAndDeleteAllMsg,
      data: {
        'conversationID': conversationID,
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

  /// 查询@所有人标识
  Future<dynamic> getAtAllTag({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getAtAllTag,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 查询@所有人标识
  String get atAllTag => 'AtAllTag';

  /// 设置阅后即焚时长
  /// [conversationID] 会话id
  /// [burnDuration] 时长s，默认30s
  Future<void> setOneConversationBurnDuration({
    required String conversationID,
    int burnDuration = 30,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setOneConversationBurnDuration,
      data: {'conversationID': conversationID, 'burnDuration': burnDuration, 'operationID': IMUtils.checkOperationID(operationID)},
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 标记会话已读,
  ///
  /// 1、会话类型为单聊，该接口用于消除未读数以及单聊的已读回执发送，调用该接口后 对方发送的消息的已读状态会更新。
  ///
  /// 2、会话类型为群聊或通知，该接口仅仅用于消除未读数
  Future<void> markConversationMessageAsRead({
    required String conversationID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.markConversationMessageAsRead,
      data: {
        'conversationID': conversationID,
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

  /// 查询@所有人标识
  Future<List<ConversationInfo>> searchConversations({
    required String name,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.searchConversations,
      data: {
        'name': name,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 会话列表自定义排序规则。
  List<ConversationInfo> simpleSort(List<ConversationInfo> list) => list
    ..sort((a, b) {
      if ((a.isPinned == true && b.isPinned == true) || (a.isPinned != true && b.isPinned != true)) {
        int aCompare = a.draftTextTime! > a.latestMsgSendTime! ? a.draftTextTime! : a.latestMsgSendTime!;
        int bCompare = b.draftTextTime! > b.latestMsgSendTime! ? b.draftTextTime! : b.latestMsgSendTime!;
        if (aCompare > bCompare) {
          return -1;
        } else if (aCompare < bCompare) {
          return 1;
        } else {
          return 0;
        }
      } else if (a.isPinned == true && b.isPinned != true) {
        return -1;
      } else {
        return 1;
      }
    });

  Future<void> changeInputStates({
    required String conversationID,
    required bool focus,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.changeInputStates,
      data: {
        'focus': focus,
        'conversationID': conversationID,
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

  Future<List<int>?> getInputStates(
    String conversationID,
    String userID, {
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getInputStates,
      data: {
        'conversationID': conversationID,
        'userID': userID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  Future<void> setConversation({
    required String conversationID,
    required ConversationReq req,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setConversation,
      data: {
        'conversationID': conversationID,
        'req': req.toJson(),
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
}
