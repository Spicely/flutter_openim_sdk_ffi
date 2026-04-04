part of '../../flutter_openim_sdk_ffi_native.dart';

class FriendshipManager {
  /// 发起好友申请，请求添加对方为好友
  ///
  /// [userID] 要添加的用户ID
  ///
  /// [reason] 请求信息
  Future<void> addFriend({
    required String userID,
    String? reason,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.addFriend,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'toUserID': userID,
        'reqMsg': reason ?? '',
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;

    receivePort.close();
    if (result.error != null) {
      throw OpenIMError(result.errCode!, result.error!, methodName: result.callMethodName);
    }
  }

  /// 获取本人作为被添加者，收到的好友申请
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsRecipient({
    String? operationID,
    GetFriendApplicationListAsRecipientReq? req,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getFriendApplicationListAsRecipient,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'req': (req ?? GetFriendApplicationListAsRecipientReq(handleResults: [], offset: 0, count: 100)).toJson(),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 获取本人作为添加者，主动发起的好友申请
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsApplicant({
    String? operationID,
    GetFriendApplicationListAsApplicantReq? req,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getFriendApplicationListAsApplicant,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'req': (req ?? GetFriendApplicationListAsApplicantReq(count: 100, offset: 0)).toJson(),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 获取好友列表，返回的列表包含了已拉入黑名单的好友
  Future<List<FriendInfo>> getFriendList({
    String? operationID,
    bool filterBlack = false,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getFriendList,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'filterBlack': filterBlack,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 分页获取指定数量好友的列表。offset为获取时的偏移量, count为获取数量
  Future<List<FriendInfo>> getFriendListPage({
    bool filterBlack = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getFriendListPage,
      data: {
        'offset': offset,
        'count': count,
        'filterBlack': filterBlack,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 把对方添加到黑名单中
  ///
  /// [userID] 被加入黑名单的好友ID
  Future<dynamic> addBlacklist({
    required String userID,
    String? operationID,
    String? ex,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.addBlacklist,
      data: {
        'userID': userID,
        'ex': ex ?? '',
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

  /// 获取黑名单列表
  Future<List<BlacklistInfo>> getBlackList({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getBlackList,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 获取黑名单列表
  Future<List<FriendInfo>> getFriendsInfo({
    required List<String> userIDList,
    bool filterBlack = false,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getFriendsInfo,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'userIDList': userIDList,
        'filterBlack': filterBlack,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 把用户从自己的黑名单中移除。
  Future<dynamic> removeBlacklist({
    required String userID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.removeBlacklist,
      data: {
        'userID': userID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 检验好友关系，检查是否在自己的好友列表中
  ///
  /// 由于好友关系是双向关系，仅检验对方是否在自己的好友列表中，并不能检验自己是否在对方的好友列表中
  ///
  /// [userIDList] 用户 ID 列表
  Future<List<FriendshipInfo>> checkFriend({
    required List<String> userIDList,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.checkFriend,
      data: {
        'userIDList': userIDList,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();

    return result.value;
  }

  /// 删除好友
  ///
  ///（1）由于是双向好友关系，此函数仅把对方从自己的好友列表中删除；
  ///
  ///（2）删除好友并不会自动删除会话，如要删除会话，可以再调用删除会话的函数。
  ///
  /// [userID] 用户ID
  Future<void> deleteFriend({
    required String userID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.deleteFriend,
      data: {
        'userID': userID,
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

  /// 同意对方添加自己为好友，双方建立双向好友关系
  ///
  /// [userID] 用户ID
  ///
  /// [handleMsg]备注说明
  Future<void> acceptFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.acceptFriendApplication,
      data: {
        'toUserID': userID,
        'handleMsg': handleMsg,
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

  /// 拒绝对方添加自己为好友
  ///
  /// [userID] 用户ID
  ///
  /// [handleMsg]备注说明
  Future<void> refuseFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.refuseFriendApplication,
      data: {
        'toUserID': userID,
        'handleMsg': handleMsg,
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

  /// 在自己的好友列表中通过关键词搜索
  ///
  /// [keywordList] 搜索关键词，目前仅支持一个关键词搜索，不能为空
  ///
  /// [isSearchUserID] 是否以关键词搜索 UserID
  ///
  /// [isSearchNickname] 是否以关键词搜索昵称，默认 false
  ///
  /// [isSearchRemark] 是否以关键词搜索备注，默认 false
  Future<List<SearchFriendsInfo>> searchFriends({
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchNickname = false,
    bool isSearchRemark = false,
    String? operationID,
  }) async {
    if (keywordList.isEmpty) {
      throw Exception('keywordList is empty');
    }
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.searchFriends,
      data: {
        'keywordList': keywordList,
        'isSearchUserID': isSearchUserID,
        'isSearchNickname': isSearchNickname,
        'isSearchRemark': isSearchRemark,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 修改好友信息，包括置顶，备注，ex 字段。
  Future<dynamic> updateFriends({
    required UpdateFriendsReq updateFriendsReq,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.updateFriends,
      data: {
        'req': updateFriendsReq.toJson(),
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
