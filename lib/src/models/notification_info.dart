import 'group_info.dart';
import 'message.dart';

/// OA notification
class OANotification {
  /// Title
  String? notificationName;

  /// Avatar
  String? notificationFaceURL;

  /// Type
  int? notificationType;

  /// Text content
  String? text;

  /// Redirect link
  String? externalUrl;

  /// 0: Text-only notification
  /// 1: Text + Image notification
  /// 2: Text + Video notification
  /// 3: Text + File notification
  int? mixType;

  /// Image information
  PictureElem? pictureElem;

  /// Sound information
  SoundElem? soundElem;

  /// Video information
  VideoElem? videoElem;

  /// File information
  FileElem? fileElem;

  /// Additional field
  String? ex;

  OANotification({this.notificationName, this.notificationFaceURL, this.notificationType, this.text, this.externalUrl, this.mixType, this.pictureElem, this.soundElem, this.videoElem, this.fileElem, this.ex});

  OANotification.fromJson(Map<String, dynamic> json) {
    notificationName = json['notificationName'];
    notificationFaceURL = json['notificationFaceURL'];
    notificationType = json['notificationType'];
    text = json['text'];
    externalUrl = json['externalUrl'];
    mixType = json['mixType'];
    pictureElem = json['pictureElem'] != null ? PictureElem.fromJson(json['pictureElem']) : null;
    soundElem = json['soundElem'] != null ? SoundElem.fromJson(json['soundElem']) : null;
    videoElem = json['videoElem'] != null ? VideoElem.fromJson(json['videoElem']) : null;
    fileElem = json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notificationName'] = notificationName;
    data['notificationFaceURL'] = notificationFaceURL;
    data['notificationType'] = notificationType;
    data['text'] = text;
    data['externalUrl'] = externalUrl;
    data['mixType'] = mixType;
    if (pictureElem != null) {
      data['pictureElem'] = pictureElem!.toJson();
    }
    if (soundElem != null) {
      data['soundElem'] = soundElem!.toJson();
    }
    if (videoElem != null) {
      data['videoElem'] = videoElem!.toJson();
    }
    if (fileElem != null) {
      data['fileElem'] = fileElem!.toJson();
    }
    data['ex'] = ex;
    return data;
  }
}

/// 群事件通知
class GroupNotification {
  /// 群信息
  GroupInfo? group;

  /// 当前事件操作者信息
  GroupMembersInfo? opUser;

  /// 群拥有者信息
  GroupMembersInfo? groupOwnerUser;

  /// 产生影响的群成员列表
  List<GroupMembersInfo>? memberList;

  GroupNotification({
    this.group,
    this.opUser,
    this.groupOwnerUser,
    this.memberList,
  });

  GroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    groupOwnerUser = json['groupOwnerUser'] != null ? GroupMembersInfo.fromJson(json['groupOwnerUser']) : null;
    if (json['memberList'] != null) {
      memberList = <GroupMembersInfo>[];
      json['memberList'].forEach((v) {
        memberList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (groupOwnerUser != null) {
      data['groupOwnerUser'] = groupOwnerUser!.toJson();
    }
    if (memberList != null) {
      data['memberList'] = memberList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 用户被邀请进群通知
class InvitedJoinGroupNotification {
  /// 群信息
  GroupInfo? group;

  /// 操作者信息
  GroupMembersInfo? opUser;

  /// 被邀请进群的成员信息
  List<GroupMembersInfo>? invitedUserList;

  InvitedJoinGroupNotification({this.group, this.opUser, this.invitedUserList});

  InvitedJoinGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    if (json['invitedUserList'] != null) {
      invitedUserList = <GroupMembersInfo>[];
      json['invitedUserList'].forEach((v) {
        invitedUserList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (invitedUserList != null) {
      data['invitedUserList'] = invitedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 组踢出成员通知
class KickedGroupMemeberNotification {
  /// 群信息
  GroupInfo? group;

  /// 操作者信息
  GroupMembersInfo? opUser;

  /// 被踢出群的成员信息列表
  List<GroupMembersInfo>? kickedUserList;

  KickedGroupMemeberNotification({this.group, this.opUser, this.kickedUserList});

  KickedGroupMemeberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    if (json['kickedUserList'] != null) {
      kickedUserList = <GroupMembersInfo>[];
      json['kickedUserList'].forEach((v) {
        kickedUserList!.add(GroupMembersInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (kickedUserList != null) {
      data['kickedUserList'] = kickedUserList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

/// 退出群通知
class QuitGroupNotification {
  /// 群信息
  GroupInfo? group;

  /// 退群的成员信息
  GroupMembersInfo? quitUser;

  QuitGroupNotification({this.group, this.quitUser});

  QuitGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    quitUser = json['quitUser'] != null ? GroupMembersInfo.fromJson(json['quitUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (quitUser != null) {
      data['quitUser'] = quitUser!.toJson();
    }
    return data;
  }
}

/// 进群通知
class EnterGroupNotification {
  /// 群信息
  GroupInfo? group;

  /// 进入群的成员信息
  GroupMembersInfo? entrantUser;

  EnterGroupNotification({this.group, this.entrantUser});

  EnterGroupNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    entrantUser = json['entrantUser'] != null ? GroupMembersInfo.fromJson(json['entrantUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (entrantUser != null) {
      data['quitUser'] = entrantUser!.toJson();
    }
    return data;
  }
}

/// 群权转让通知
class GroupRightsTransferNoticication {
  /// 群信息
  GroupInfo? group;

  /// 操作者信息
  GroupMembersInfo? opUser;

  /// 群新的拥有者信息
  GroupMembersInfo? newGroupOwner;

  GroupRightsTransferNoticication({
    this.group,
    this.opUser,
    this.newGroupOwner,
  });

  GroupRightsTransferNoticication.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    newGroupOwner = json['newGroupOwner'] != null ? GroupMembersInfo.fromJson(json['newGroupOwner']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (newGroupOwner != null) {
      data['newGroupOwner'] = newGroupOwner!.toJson();
    }
    return data;
  }
}

/// 禁言成员通知
class MuteMemberNotification {
  /// 群信息
  GroupInfo? group;

  /// 操作者信息
  GroupMembersInfo? opUser;

  /// 被禁言的成员信息
  GroupMembersInfo? mutedUser;

  /// 禁言时间s
  int? mutedSeconds;

  MuteMemberNotification({
    this.group,
    this.opUser,
    this.mutedUser,
    this.mutedSeconds,
  });

  MuteMemberNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    mutedUser = json['mutedUser'] != null ? GroupMembersInfo.fromJson(json['mutedUser']) : null;
    mutedSeconds = json['mutedSeconds'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (mutedUser != null) {
      data['mutedUser'] = mutedUser!.toJson();
    }
    data['mutedSeconds'] = mutedSeconds;
    return data;
  }
}

/// 阅后即焚通知
class BurnAfterReadingNotification {
  /// 接收者
  String? recvID;

  /// 发送者
  String? sendID;

  /// 是否开启
  bool? isPrivate;

  BurnAfterReadingNotification({this.recvID, this.sendID, this.isPrivate});

  BurnAfterReadingNotification.fromJson(Map<String, dynamic> json) {
    recvID = json['recvID'];
    sendID = json['sendID'];
    isPrivate = json['isPrivate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['recvID'] = recvID;
    data['sendID'] = sendID;
    data['isPrivate'] = isPrivate;
    return data;
  }
}

/// 群成员信息发送变化通知
class GroupMemberInfoChangedNotification {
  /// 群信息
  GroupInfo? group;

  /// 操作者信息
  GroupMembersInfo? opUser;

  /// 资料发生改变的成员
  GroupMembersInfo? changedUser;

  GroupMemberInfoChangedNotification({
    this.group,
    this.opUser,
    this.changedUser,
  });

  GroupMemberInfoChangedNotification.fromJson(Map<String, dynamic> json) {
    group = json['group'] != null ? GroupInfo.fromJson(json['group']) : null;
    opUser = json['opUser'] != null ? GroupMembersInfo.fromJson(json['opUser']) : null;
    changedUser = json['changedUser'] != null ? GroupMembersInfo.fromJson(json['changedUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (opUser != null) {
      data['opUser'] = opUser!.toJson();
    }
    if (changedUser != null) {
      data['changedUser'] = changedUser!.toJson();
    }
    return data;
  }
}
