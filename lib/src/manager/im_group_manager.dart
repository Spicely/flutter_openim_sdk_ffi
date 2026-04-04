part of '../../flutter_openim_sdk_ffi_native.dart';

class GroupManager {
  /// 邀请进组，直接进组无需同意。
  ///
  /// [groupId] 组ID
  ///
  /// [uidList] 用户ID列表
  Future<List<GroupInviteResult>> inviteUserToGroup({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.inviteUserToGroup,
      data: {
        'groupID': groupID,
        'userIDList': userIDList,
        'reason': reason ?? '',
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 移除组成员
  /// [groupId] 组ID
  ///
  /// [userIDList] 用户ID列表
  ///
  /// [reason]  备注说明
  Future<List<GroupInviteResult>> kickGroupMember({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.kickGroupMember,
      data: {
        'groupID': groupID,
        'userIDList': userIDList,
        'reason': reason ?? '',
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 查询组成员资料
  ///
  /// [groupID] 组ID
  ///
  /// [userIDList] 用户ID列表
  Future<List<GroupMembersInfo>> getGroupMembersInfo({
    required String groupID,
    required List<String> userIDList,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getGroupMembersInfo,
      data: {
        'groupID': groupID,
        'userIDList': userIDList,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 分页获取组成员列表
  ///
  /// [groupID] 群ID
  ///
  /// [filter] 过滤成员 0所有，1普通成员, 2群主，3管理员，4管理员+普通成员
  ///
  /// [offset] 开始下标
  ///
  /// [count] 总数
  Future<List<GroupMembersInfo>> getGroupMemberList({
    required String groupID,
    int filter = 0,
    int offset = 0,
    int count = 10,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getGroupMemberList,
      data: {
        'groupID': groupID,
        'filter': filter,
        'offset': offset,
        'count': count,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 查询已加入的组列表
  Future<List<GroupInfo>> getJoinedGroupList({
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getJoinedGroupList,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 检查是否已加入组
  ///
  /// [groupID] 组ID
  Future<bool> isJoinGroup({
    required String groupID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.isJoinGroup,
      data: {
        'groupID': groupID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value == 'true';
  }

  /// 创建一个组
  ///
  /// [groupInfo] 群信息
  ///
  /// [memberUserIDs] 群成员ID列表
  ///
  /// [adminUserIDs] 群管理员ID列表
  ///
  /// [ownerUserID] 群主ID
  ///
  /// [operationID] 操作ID
  Future<GroupInfo> createGroup({
    required GroupInfo groupInfo,
    List<String> memberUserIDs = const [],
    List<String> adminUserIDs = const [],
    String? ownerUserID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.createGroup,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'groupInfo': groupInfo.toJson(),
        'memberUserIDs': memberUserIDs,
        'adminUserIDs': adminUserIDs,
        'ownerUserID': ownerUserID,
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 编辑组资料
  Future<void> setGroupInfo({
    required GroupInfo groupInfo,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setGroupInfo,
      data: {
        'groupInfo': groupInfo.toJson(),
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

  /// 获取指定群信息
  ///
  /// [groupIDList] 组ID列表
  Future<List<GroupInfo>> getGroupsInfo({
    required List<String> groupIDList,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getGroupsInfo,
      data: {
        'groupIDList': groupIDList,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 申请加入组，需要通过管理员/群组同意。
  /// [joinSource] 2：通过邀请  3：通过搜索  4：通过二维码
  Future<void> joinGroup({
    required String groupID,
    String? reason,
    int joinSource = 3,
    String? ex,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.joinGroup,
      data: {
        'groupID': groupID,
        'reason': reason ?? '',
        'joinSource': joinSource,
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

  /// 退出组
  Future<void> quitGroup({
    required String groupID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.quitGroup,
      data: {
        'groupID': groupID,
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

  /// 转移组拥有者权限
  ///
  /// [groupID] 组ID
  ///
  /// [groupID] 新拥有者ID
  Future<void> transferGroupOwner({
    required String groupID,
    required String userID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.transferGroupOwner,
      data: {
        'groupID': groupID,
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

  /// 作为群主或者管理员，收到的群成员入群申请
  Future<List<GroupApplicationInfo>> getGroupApplicationListAsRecipient({
    String? operationID,
    GetGroupApplicationListAsApplicantReq? req,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getGroupApplicationListAsRecipient,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'req': (req ?? GetGroupApplicationListAsApplicantReq(groupIDs: [], handleResults: [], offset: 0, count: 100)).toJson(),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 获取自己发出的入群申请记录
  Future<List<GroupApplicationInfo>> getGroupApplicationListAsApplicant({
    String? operationID,
    GetGroupApplicationListAsApplicantReq? req,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getGroupApplicationListAsApplicant,
      data: {
        'operationID': IMUtils.checkOperationID(operationID),
        'req': (req ?? GetGroupApplicationListAsApplicantReq(groupIDs: [], handleResults: [], offset: 0, count: 100)).toJson(),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 管理员或者群主同意某人进入某群
  ///
  /// 注：主动申请入群需要通过管理员/群组处理，被别人拉入群不需要管理员/群组处理
  ///
  /// [groupID] 组id
  ///
  /// [userID] 申请者用户ID
  Future<void> acceptGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.acceptGroupApplication,
      data: {
        'groupID': groupID,
        'userID': userID,
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

  /// 管理员或者群主拒绝某人进入某群
  ///
  /// 注：主动申请入群需要通过管理员/群组处理，被别人拉入群不需要管理员/群组处理
  ///
  /// [groupID] 组id
  ///
  /// [userID] 申请者用户ID
  ///
  /// [handleMsg] 说明
  Future<void> refuseGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.refuseGroupApplication,
      data: {
        'groupID': groupID,
        'userID': userID,
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

  /// 解散群
  ///
  /// [groupID] 群ID
  Future<void> dismissGroup({
    required String groupID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.dismissGroup,
      data: {
        'groupID': groupID,
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

  /// 开启群禁言，所有群成员禁止发言
  ///
  /// [groupID] 将开启群禁言的组ID
  ///
  /// [mute] true：开启，false：关闭
  Future<void> changeGroupMute({
    required String groupID,
    required bool mute,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.changeGroupMute,
      data: {
        'groupID': groupID,
        'mute': mute,
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

  /// 禁言群成员
  ///
  /// [groupID] 群ID
  ///
  /// [userID] 将被禁言的成员ID
  ///
  /// [seconds] 被禁言的时间s，设置为0则为解除禁言
  Future<void> changeGroupMemberMute({
    required String groupID,
    required String userID,
    int seconds = 0,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.changeGroupMemberMute,
      data: {
        'groupID': groupID,
        'userID': userID,
        'seconds': seconds,
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

  /// 查询群
  ///
  /// [keywordList] 搜索关键词，目前仅支持一个关键词搜索，不能为空
  ///
  /// [isSearchGroupID] 是否以关键词搜索群ID(注：两个不可以同时为false)，为空默认false
  ///
  /// [isSearchGroupName] 是否以关键词搜索群名字，为空默认false
  Future<List<GroupInfo>> searchGroups({
    List<String> keywordList = const [],
    bool isSearchGroupID = false,
    bool isSearchGroupName = false,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.searchGroups,
      data: {
        'keywordList': keywordList,
        'isSearchGroupID': isSearchGroupID,
        'isSearchGroupName': isSearchGroupName,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 根据加入时间分页获取组成员列表
  ///
  /// [groupID] 群ID
  ///
  /// [joinTimeBegin] 加入开始时间
  ///
  /// [joinTimeEnd] 加入结束时间
  ///
  /// [offset] 开始下标
  ///
  /// [count] 总数
  ///
  /// [filterUserIDList] 排除的用户
  Future<List<GroupMembersInfo>> getGroupMemberListByJoinTime({
    required String groupID,
    int offset = 0,
    int count = 0,
    int joinTimeBegin = 0,
    int joinTimeEnd = 0,
    List<String> filterUserIDList = const [],
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getGroupMemberListByJoinTimeFilter,
      data: {
        'groupID': groupID,
        'offset': offset,
        'count': count,
        'joinTimeBegin': joinTimeBegin,
        'joinTimeEnd': joinTimeEnd,
        'excludeUserIDList': filterUserIDList,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 获取群拥有者，管理员
  ///
  /// [groupID] 群ID
  Future<List<GroupMembersInfo>> getGroupOwnerAndAdmin({
    required String groupID,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getGroupMemberOwnerAndAdmin,
      data: {
        'groupID': groupID,
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 查询群
  /// [groupID] 群id
  ///
  /// [keywordList] 搜索关键词，目前仅支持一个关键词搜索，不能为空
  ///
  /// [isSearchUserID] 是否以关键词搜成员id
  ///
  /// [isSearchMemberNickname] 是否以关键词搜索成员昵称
  ///
  /// [offset] 开始index
  ///
  /// [count] 每次获取的总数
  Future<List<GroupMembersInfo>> searchGroupMembers({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.searchGroupMembers,
      data: {
        'searchParam': {
          'groupID': groupID,
          'keywordList': keywordList,
          'isSearchUserID': isSearchUserID,
          'isSearchMemberNickname': isSearchMemberNickname,
          'offset': offset,
          'count': count,
        },
        'operationID': IMUtils.checkOperationID(operationID),
      },
      sendPort: receivePort.sendPort,
    ));
    _PortResult result = await receivePort.first;
    receivePort.close();
    return result.value;
  }

  /// 修改GroupMemberInfo字段
  Future<void> setGroupMemberInfo({
    required SetGroupMemberInfo groupMembersInfo,
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.setGroupMemberInfo,
      data: {
        'info': groupMembersInfo.toJson(),
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

  Future<dynamic> getUsersInGroup(
    String groupID,
    List<String> userIDs, {
    String? operationID,
  }) async {
    ReceivePort receivePort = ReceivePort();
    OpenIMManager._sendPort.send(_PortModel(
      method: _PortMethod.getUsersInGroup,
      data: {
        'groupID': groupID,
        'userIDs': userIDs,
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
