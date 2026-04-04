

class UserInfo {
  /// User ID
  String? userID;

  /// User nickname
  String? nickname;

  /// Profile picture
  String? faceURL;

  /// Additional information
  String? ex;

  /// Creation time
  int? createTime;

  /// Remark
  String? remark;

  /// Global do not disturb setting:
  /// 0: Normal
  /// 1: Do not accept messages
  /// 2: Accept online messages but not offline messages
  int? globalRecvMsgOpt;

  int? appMangerLevel;

  UserInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.appMangerLevel,
    this.ex,
    this.createTime,
    this.remark,
    this.globalRecvMsgOpt,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'] ?? userID;
    nickname = json['nickname'] ?? nickname;
    faceURL = json['faceURL'] ?? faceURL;
    remark = json['remark'] ?? remark;
    ex = json['ex'] ?? ex;
    createTime = json['createTime'];
    globalRecvMsgOpt = json['globalRecvMsgOpt'];
    appMangerLevel = json['appMangerLevel'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['appMangerLevel'] = appMangerLevel;
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    data['createTime'] = createTime;
    data['remark'] = remark;
    data['globalRecvMsgOpt'] = globalRecvMsgOpt;
    return data;
  }

  String getShowName() => _isNull(remark) ?? _isNull(nickname) ?? userID!;

  static String? _isNull(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return value;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserInfo && runtimeType == other.runtimeType && userID == other.userID;

  @override
  int get hashCode => userID.hashCode;
}

class PublicUserInfo {
  /// User ID
  String? userID;

  /// Nickname
  String? nickname;

  /// Profile picture
  String? faceURL;

  /// App Manager Level:
  /// 1: AppOrdinaryUsers
  /// 2: AppAdmin
  int? appManagerLevel;

  /// Additional information
  String? ex;

  PublicUserInfo({
    this.userID,
    this.nickname,
    this.faceURL,
    this.appManagerLevel,
    this.ex,
  });

  PublicUserInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    appManagerLevel = json['appManagerLevel'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['appMangerLevel'] = appManagerLevel;
    data['ex'] = ex;
    return data;
  }
}

class FriendInfo {
  /// owner User ID
  String? ownerUserID;

  /// User ID
  String? userID;

  /// Nickname
  String? nickname;

  /// Profile picture
  String? faceURL;

  /// friend User ID
  String? friendUserID;

  /// Remark
  String? remark;

  /// Additional information
  String? ex;

  /// Creation time
  int? createTime;

  /// Add source
  int? addSource;

  /// Operator User ID
  String? operatorUserID;

  FriendInfo({
    this.ownerUserID,
    this.userID,
    this.nickname,
    this.faceURL,
    this.friendUserID,
    this.remark,
    this.ex,
    this.createTime,
    this.addSource,
    this.operatorUserID,
  });

  FriendInfo.fromJson(Map<String, dynamic> json) {
    ownerUserID = json['ownerUserID'];
    userID = json['userID'];
    remark = json['remark'];
    createTime = json['createTime'];
    addSource = json['addSource'];
    operatorUserID = json['operatorUserID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    friendUserID = json['friendUserID'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ownerUserID'] = ownerUserID;
    data['userID'] = userID;
    data['remark'] = remark;
    data['createTime'] = createTime;
    data['addSource'] = addSource;
    data['operatorUserID'] = operatorUserID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['friendUserID'] = friendUserID;
    data['ex'] = ex;
    return data;
  }

  String getShowName() => _isNull(remark) ?? _isNull(nickname) ?? userID!;

  static String? _isNull(String? value) {
    if (value == null || value.trim().isEmpty) return null;
    return value;
  }
}

class BlacklistInfo {
  /// User ID
  String? userID;

  /// Nickname
  String? nickname;

  /// owner User ID
  String? ownerUserID;

  /// block User ID
  String? blockUserID;

  /// Profile picture
  String? faceURL;

  /// Gender
  int? gender;

  /// Creation time
  int? createTime;

  /// Add source
  int? addSource;

  /// Operator User ID
  String? operatorUserID;

  /// Additional information
  String? ex;

  BlacklistInfo({
    this.ownerUserID,
    this.blockUserID,
    this.userID,
    this.nickname,
    this.faceURL,
    this.gender,
    this.createTime,
    this.addSource,
    this.operatorUserID,
    this.ex,
  });

  BlacklistInfo.fromJson(Map<String, dynamic> json) {
    ownerUserID = json['ownerUserID'];
    blockUserID = json['blockUserID'];
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    gender = json['gender'];
    createTime = json['createTime'];
    addSource = json['addSource'];
    operatorUserID = json['operatorUserID'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ownerUserID'] = ownerUserID;
    data['blockUserID'] = blockUserID;
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['gender'] = gender;
    data['createTime'] = createTime;
    data['addSource'] = addSource;
    data['operatorUserID'] = operatorUserID;
    data['ex'] = ex;
    return data;
  }
}

class FriendshipInfo {
  /// User ID
  String? userID;

  /// 1 represents a friend (and not in the blacklist)
  int? result;

  FriendshipInfo({this.userID, this.result});

  FriendshipInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['result'] = result;
    return data;
  }
}

class FriendApplicationInfo {
  /// Initiator user ID
  String? fromUserID;

  /// Initiator user nickname
  String? fromNickname;

  /// Initiator user profile picture
  String? fromFaceURL;

  /// Recipient user ID
  String? toUserID;

  /// Recipient user nickname
  String? toNickname;

  /// Recipient user profile picture
  String? toFaceURL;

  /// Handling result
  int? handleResult;

  /// Request message
  String? reqMsg;

  /// Creation time
  int? createTime;

  /// Handler user ID
  String? handlerUserID;

  /// Handling remark
  String? handleMsg;

  /// Handling time
  int? handleTime;

  /// Additional information
  String? ex;

  FriendApplicationInfo({this.fromUserID, this.fromNickname, this.fromFaceURL, this.toUserID, this.toNickname, this.toFaceURL, this.handleResult, this.reqMsg, this.createTime, this.handlerUserID, this.handleMsg, this.handleTime, this.ex});

  FriendApplicationInfo.fromJson(Map<String, dynamic> json) {
    fromUserID = json['fromUserID'];
    fromNickname = json['fromNickname'];
    fromFaceURL = json['fromFaceURL'];
    toUserID = json['toUserID'];
    toNickname = json['toNickname'];
    toFaceURL = json['toFaceURL'];
    handleResult = json['handleResult'];
    reqMsg = json['reqMsg'];
    createTime = json['createTime'];
    handlerUserID = json['handlerUserID'];
    handleMsg = json['handleMsg'];
    handleTime = json['handleTime'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fromUserID'] = fromUserID;
    data['fromNickname'] = fromNickname;
    data['fromFaceURL'] = fromFaceURL;
    data['toUserID'] = toUserID;
    data['toNickname'] = toNickname;
    data['toFaceURL'] = toFaceURL;
    data['handleResult'] = handleResult;
    data['reqMsg'] = reqMsg;
    data['createTime'] = createTime;
    data['handlerUserID'] = handlerUserID;
    data['handleMsg'] = handleMsg;
    data['handleTime'] = handleTime;
    data['ex'] = ex;
    return data;
  }

  /// Waiting to be processed
  bool get isWaitingHandle => handleResult == 0;

  /// Already agreed
  bool get isAgreed => handleResult == 1;

  /// Already rejected
  bool get isRejected => handleResult == -1;
}

class UserStatusInfo {
  /// User ID
  String? userID;

  /// Status
  int? status;

  /// Platform IDs
  List<int>? platformIDs;

  UserStatusInfo({
    this.userID,
    this.status,
    this.platformIDs,
  });

  UserStatusInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    status = json['status'];
    platformIDs = json["platformIDs"] == null ? [] : List<int>.from(json["platformIDs"].map((x) => x));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['status'] = status;
    data['platformIDs'] = List<dynamic>.from(platformIDs!.map((x) => x));
    return data;
  }
}
