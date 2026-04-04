import '../enum/conversation_type.dart';



class Message {
  /// Message ID, a unique identifier.
  String? clientMsgID;

  /// Server-generated ID.
  String? serverMsgID;

  /// Creation time.
  int? createTime;

  /// Sending time.
  int? sendTime;

  /// Conversation type [ConversationType].
  int? sessionType;

  /// Sender's ID.
  String? sendID;

  /// Receiver's ID.
  String? recvID;

  /// Source.
  int? msgFrom;

  /// Message type [MessageType].
  int? contentType;

  /// Platform [Platform].
  int? senderPlatformID;

  /// Sender's nickname.
  String? senderNickname;

  /// Sender's avatar.
  String? senderFaceUrl;

  /// Group ID.
  String? groupID;

  /// Message localEx.
  String? localEx;

  /// Message sequence number.
  int? seq;

  /// Whether it's read.
  bool? isRead;

  /// Read time.
  int? hasReadTime;

  /// Message sending status [MessageStatus].
  int? status;

  /// Is it a reaction.
  bool? isReact;

  /// Is it an external extension.
  bool? isExternalExtensions;

  /// Offline display content.
  OfflinePushInfo? offlinePush;

  /// Additional information.
  String? attachedInfo;

  /// Extended information.
  String? ex;

  /// Custom extended information, currently used for message time segmentation on the client side.
  Map<String, dynamic> exMap = {};

  /// Image.
  PictureElem? pictureElem;

  /// Voice.
  SoundElem? soundElem;

  /// Video.
  VideoElem? videoElem;

  /// File.
  FileElem? fileElem;

  /// @ Information.
  AtTextElem? atTextElem;

  /// Location.
  LocationElem? locationElem;

  /// Custom.
  CustomElem? customElem;

  /// Quote.
  QuoteElem? quoteElem;

  /// Merge.
  MergeElem? mergeElem;

  /// Notification.
  NotificationElem? notificationElem;

  /// Custom emoji.
  FaceElem? faceElem;

  /// Additional information.
  AttachedInfoElem? attachedInfoElem;

  /// Text content.
  TextElem? textElem;

  /// Business card.
  CardElem? cardElem;

  ///
  AdvancedTextElem? advancedTextElem;

  ///
  TypingElem? typingElem;

  Message({
    this.clientMsgID,
    this.serverMsgID,
    this.createTime,
    this.sendTime,
    this.sessionType,
    this.sendID,
    this.recvID,
    this.msgFrom,
    this.contentType,
    this.senderPlatformID,
    this.senderNickname,
    this.senderFaceUrl,
    this.groupID,
    this.localEx,
    this.seq,
    this.isRead,
    this.hasReadTime,
    this.status,
    this.offlinePush,
    this.attachedInfo,
    this.ex,
    this.exMap = const <String, dynamic>{},
    this.pictureElem,
    this.soundElem,
    this.videoElem,
    this.fileElem,
    this.atTextElem,
    this.locationElem,
    this.customElem,
    this.quoteElem,
    this.mergeElem,
    this.notificationElem,
    this.faceElem,
    this.attachedInfoElem,
    this.isExternalExtensions,
    this.isReact,
    this.textElem,
    this.cardElem,
    this.advancedTextElem,
    this.typingElem,
  });

  Message.fromJson(Map<String, dynamic> json) {
    clientMsgID = json['clientMsgID'];
    serverMsgID = json['serverMsgID'];
    createTime = json['createTime'];
    sendTime = json['sendTime'];
    sendID = json['sendID'];
    recvID = json['recvID'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    senderPlatformID = json['senderPlatformID'];
    senderNickname = json['senderNickname'];
    senderFaceUrl = json['senderFaceUrl'];
    groupID = json['groupID'];
    localEx = json['localEx'];
    seq = json['seq'];
    isRead = json['isRead'];
    status = json['status'];
    offlinePush = json['offlinePush'] != null ? OfflinePushInfo.fromJson(json['offlinePush']) : null;
    attachedInfo = json['attachedInfo'];
    ex = json['ex'];
    exMap = json['exMap'] ?? {};
    sessionType = json['sessionType'];
    pictureElem = json['pictureElem'] != null ? PictureElem.fromJson(json['pictureElem']) : null;
    soundElem = json['soundElem'] != null ? SoundElem.fromJson(json['soundElem']) : null;
    videoElem = json['videoElem'] != null ? VideoElem.fromJson(json['videoElem']) : null;
    fileElem = json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    atTextElem = json['atTextElem'] != null ? AtTextElem.fromJson(json['atTextElem']) : null;
    locationElem = json['locationElem'] != null ? LocationElem.fromJson(json['locationElem']) : null;

    customElem = json['customElem'] != null ? CustomElem.fromJson(json['customElem']) : null;
    quoteElem = json['quoteElem'] != null ? QuoteElem.fromJson(json['quoteElem']) : null;
    mergeElem = json['mergeElem'] != null ? MergeElem.fromJson(json['mergeElem']) : null;
    notificationElem = json['notificationElem'] != null ? NotificationElem.fromJson(json['notificationElem']) : null;
    faceElem = json['faceElem'] != null ? FaceElem.fromJson(json['faceElem']) : null;
    attachedInfoElem = json['attachedInfoElem'] != null ? AttachedInfoElem.fromJson(json['attachedInfoElem']) : null;
    hasReadTime = json['hasReadTime'] ?? attachedInfoElem?.hasReadTime;
    isExternalExtensions = json['isExternalExtensions'];
    isReact = json['isReact'];
    textElem = json['textElem'] != null ? TextElem.fromJson(json['textElem']) : null;
    cardElem = json['cardElem'] != null ? CardElem.fromJson(json['cardElem']) : null;
    advancedTextElem = json['advancedTextElem'] != null ? AdvancedTextElem.fromJson(json['advancedTextElem']) : null;
    typingElem = json['typingElem'] != null ? TypingElem.fromJson(json['typingElem']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['clientMsgID'] = clientMsgID;
    data['serverMsgID'] = serverMsgID;
    data['createTime'] = createTime;
    data['sendTime'] = sendTime;
    data['sendID'] = sendID;
    data['recvID'] = recvID;
    data['msgFrom'] = msgFrom;
    data['contentType'] = contentType;
    data['senderPlatformID'] = senderPlatformID;
    data['senderNickname'] = senderNickname;
    data['senderFaceUrl'] = senderFaceUrl;
    data['groupID'] = groupID;
    data['localEx'] = localEx;
    data['seq'] = seq;
    data['isRead'] = isRead;
    data['hasReadTime'] = hasReadTime;
    data['status'] = status;
    data['offlinePush'] = offlinePush?.toJson();
    data['attachedInfo'] = attachedInfo;
    data['ex'] = ex;
    data['exMap'] = exMap;
    data['sessionType'] = sessionType;
    data['pictureElem'] = pictureElem?.toJson();
    data['soundElem'] = soundElem?.toJson();
    data['videoElem'] = videoElem?.toJson();
    data['fileElem'] = fileElem?.toJson();
    data['atTextElem'] = atTextElem?.toJson();
    data['locationElem'] = locationElem?.toJson();
    data['customElem'] = customElem?.toJson();
    data['quoteElem'] = quoteElem?.toJson();
    data['mergeElem'] = mergeElem?.toJson();
    data['notificationElem'] = notificationElem?.toJson();
    data['faceElem'] = faceElem?.toJson();
    data['attachedInfoElem'] = attachedInfoElem?.toJson();
    data['isExternalExtensions'] = isExternalExtensions;
    data['isReact'] = isReact;
    data['textElem'] = textElem?.toJson();
    data['cardElem'] = cardElem?.toJson();
    data['advancedTextElem'] = advancedTextElem?.toJson();
    data['typingElem'] = typingElem?.toJson();
    return data;
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is Message && runtimeType == other.runtimeType && clientMsgID == other.clientMsgID;

  @override
  int get hashCode => clientMsgID.hashCode;

  void update(Message message) {
    if (this != message) return;
    serverMsgID = message.serverMsgID;
    createTime = message.createTime;
    sendTime = message.sendTime;
    sendID = message.sendID;
    recvID = message.recvID;
    msgFrom = message.msgFrom;
    contentType = message.contentType;
    senderPlatformID = message.senderPlatformID;
    senderNickname = message.senderNickname;
    senderFaceUrl = message.senderFaceUrl;
    groupID = message.groupID;
    // content = message.content;
    seq = message.seq;
    isRead = message.isRead;
    hasReadTime = message.hasReadTime;
    status = message.status;
    offlinePush = message.offlinePush;
    attachedInfo = message.attachedInfo;
    ex = message.ex;
    exMap = message.exMap;
    sessionType = message.sessionType;
    pictureElem = message.pictureElem;
    soundElem = message.soundElem;
    videoElem = message.videoElem;
    fileElem = message.fileElem;
    atTextElem = message.atTextElem;
    locationElem = message.locationElem;
    customElem = message.customElem;
    quoteElem = message.quoteElem;
    mergeElem = message.mergeElem;
    notificationElem = message.notificationElem;
    faceElem = message.faceElem;
    attachedInfoElem = message.attachedInfoElem;
    textElem = message.textElem;
    cardElem = message.cardElem;
    advancedTextElem = message.advancedTextElem;
    typingElem = message.typingElem;
  }

  /// Single chat message
  bool get isSingleChat => sessionType == ConversationType.single.rawValue;

  /// Group chat message
  bool get isGroupChat => sessionType == ConversationType.group.rawValue || sessionType == ConversationType.superGroup.rawValue;
}

/// Image message content
class PictureElem {
  /// Original path
  String? sourcePath;

  /// Original picture object
  PictureInfo? sourcePicture;

  /// Big picture object
  PictureInfo? bigPicture;

  /// Thumbnail picture object
  PictureInfo? snapshotPicture;

  PictureElem({this.sourcePath, this.sourcePicture, this.bigPicture, this.snapshotPicture});

  PictureElem.fromJson(Map<String, dynamic> json) {
    sourcePath = json['sourcePath'];
    sourcePicture = json['sourcePicture'] != null ? new PictureInfo.fromJson(json['sourcePicture']) : null;
    bigPicture = json['bigPicture'] != null ? new PictureInfo.fromJson(json['bigPicture']) : null;
    snapshotPicture = json['snapshotPicture'] != null ? new PictureInfo.fromJson(json['snapshotPicture']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sourcePath'] = sourcePath;
    if (sourcePicture != null) {
      data['sourcePicture'] = sourcePicture?.toJson();
    }
    if (bigPicture != null) {
      data['bigPicture'] = bigPicture?.toJson();
    }
    if (snapshotPicture != null) {
      data['snapshotPicture'] = snapshotPicture?.toJson();
    }
    return data;
  }
}

/// Image information
class PictureInfo {
  /// ID
  String? uuid;

  /// Image MIME type
  String? type;

  /// Size
  int? size;

  /// Width
  int? width;

  /// Height
  int? height;

  /// Image URL
  String? url;

  PictureInfo({this.uuid, this.type, this.size, this.width, this.height, this.url});

  PictureInfo.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    type = json['type'];
    size = json['size'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['type'] = type;
    data['size'] = size;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    return data;
  }
}

/// Voice message content
class SoundElem {
  /// ID
  String? uuid;

  /// Original path
  String? soundPath;

  /// URL address
  String? sourceUrl;

  /// Size
  int? dataSize;

  /// Duration in seconds
  int? duration;

  SoundElem({this.uuid, this.soundPath, this.sourceUrl, this.dataSize, this.duration});

  SoundElem.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    soundPath = json['soundPath'];
    sourceUrl = json['sourceUrl'];
    dataSize = json['dataSize'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['soundPath'] = soundPath;
    data['sourceUrl'] = sourceUrl;
    data['dataSize'] = dataSize;
    data['duration'] = duration;
    return data;
  }
}

/// Video message content
class VideoElem {
  /// Video path
  String? videoPath;

  /// UUID
  String? videoUUID;

  /// URL address of the video
  String? videoUrl;

  /// MIME type
  String? videoType;

  /// Size
  int? videoSize;

  /// Duration in seconds
  int? duration;

  /// Snapshot path
  String? snapshotPath;

  /// Snapshot UUID
  String? snapshotUUID;

  /// Snapshot size
  int? snapshotSize;

  /// Snapshot URL address
  String? snapshotUrl;

  /// Snapshot width
  int? snapshotWidth;

  /// Snapshot height
  int? snapshotHeight;

  VideoElem({this.videoPath, this.videoUUID, this.videoUrl, this.videoType, this.videoSize, this.duration, this.snapshotPath, this.snapshotUUID, this.snapshotSize, this.snapshotUrl, this.snapshotWidth, this.snapshotHeight});

  VideoElem.fromJson(Map<String, dynamic> json) {
    videoPath = json['videoPath'];
    videoUUID = json['videoUUID'];
    videoUrl = json['videoUrl'];
    videoType = json['videoType'];
    videoSize = json['videoSize'];
    duration = json['duration'];
    snapshotPath = json['snapshotPath'];
    snapshotUUID = json['snapshotUUID'];
    snapshotSize = json['snapshotSize'];
    snapshotUrl = json['snapshotUrl'];
    snapshotWidth = json['snapshotWidth'];
    snapshotHeight = json['snapshotHeight'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['videoPath'] = videoPath;
    data['videoUUID'] = videoUUID;
    data['videoUrl'] = videoUrl;
    data['videoType'] = videoType;
    data['videoSize'] = videoSize;
    data['duration'] = duration;
    data['snapshotPath'] = snapshotPath;
    data['snapshotUUID'] = snapshotUUID;
    data['snapshotSize'] = snapshotSize;
    data['snapshotUrl'] = snapshotUrl;
    data['snapshotWidth'] = snapshotWidth;
    data['snapshotHeight'] = snapshotHeight;
    return data;
  }
}

/// File message content
class FileElem {
  /// File path
  String? filePath;

  /// UUID
  String? uuid;

  /// File URL address
  String? sourceUrl;

  /// File name
  String? fileName;

  /// File size
  int? fileSize;

  FileElem({this.filePath, this.uuid, this.sourceUrl, this.fileName, this.fileSize});

  FileElem.fromJson(Map<String, dynamic> json) {
    filePath = json['filePath'];
    uuid = json['uuid'];
    sourceUrl = json['sourceUrl'];
    fileName = json['fileName'];
    fileSize = json['fileSize'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['filePath'] = filePath;
    data['uuid'] = uuid;
    data['sourceUrl'] = sourceUrl;
    data['fileName'] = fileName;
    data['fileSize'] = fileSize;
    return data;
  }
}

/// @ Message Content
class AtTextElem {
  /// Message content
  String? text;

  /// List of user IDs mentioned in the message
  List<String>? atUserList;

  /// Whether it includes a mention of oneself
  bool? isAtSelf;

  /// List of user IDs and their nicknames mentioned in the message, used to replace user IDs with nicknames in the message content
  List<AtUserInfo>? atUsersInfo;

  /// Message that is being replied to, when replying to someone and mentioning others
  Message? quoteMessage;

  AtTextElem({
    this.text,
    this.atUserList,
    this.isAtSelf,
    this.atUsersInfo,
    this.quoteMessage,
  });

  AtTextElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['atUserList'] is List) {
      atUserList = (json['atUserList'] as List).map((e) => '$e').toList();
    }
    isAtSelf = json['isAtSelf'];
    if (json['atUsersInfo'] is List) {
      atUsersInfo = (json['atUsersInfo'] as List).map((e) => AtUserInfo.fromJson(e)).toList();
    }
    quoteMessage = null != json['quoteMessage'] ? Message.fromJson(json['quoteMessage']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['atUserList'] = atUserList;
    data['isAtSelf'] = isAtSelf;
    data['atUsersInfo'] = atUsersInfo?.map((e) => e.toJson()).toList();
    data['quoteMessage'] = quoteMessage?.toJson();
    return data;
  }
}

/// Location Message
class LocationElem {
  /// Location description
  String? description;

  /// Longitude
  double? longitude;

  /// Latitude
  double? latitude;

  LocationElem({this.description, this.longitude, this.latitude});

  LocationElem.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    if (json['longitude'] is int) {
      longitude = (json['longitude'] as int).toDouble();
    } else {
      longitude = json['longitude'];
    }

    if (json['latitude'] is int) {
      latitude = (json['latitude'] as int).toDouble();
    } else {
      latitude = json['latitude'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}

/// Custom Message
class CustomElem {
  /// Custom data
  String? data;

  /// Extended content
  String? extension;

  /// Description
  String? description;

  CustomElem({this.data, this.extension, this.description});

  CustomElem.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    extension = json['extension'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data;
    data['extension'] = extension;
    data['description'] = description;
    return data;
  }
}

/// Quoted Message (Reply to a message)
class QuoteElem {
  /// Reply content
  String? text;

  /// The message being replied to
  Message? quoteMessage;

  QuoteElem({this.text, this.quoteMessage});

  QuoteElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['quoteMessage'] is Map) {
      quoteMessage = Message.fromJson(json['quoteMessage']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['quoteMessage'] = quoteMessage?.toJson();
    return data;
  }
}

/// Merged Message Body
class MergeElem {
  /// Title
  String? title;

  /// Summary
  List<String>? abstractList;

  /// List of specific messages to merge
  List<Message>? multiMessage;

  MergeElem({this.title, this.abstractList, this.multiMessage});

  MergeElem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['abstractList'] is List) {
      abstractList = json['abstractList'].cast<String>();
    }
    if (json['multiMessage'] is List) {
      multiMessage = (json['multiMessage'] as List).map((e) => Message.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['abstractList'] = abstractList;
    data['multiMessage'] = multiMessage?.map((e) => e.toJson()).toList();
    return data;
  }
}

/// Notification
class NotificationElem {
  /// Details
  String? detail;

  /// Default tips
  String? defaultTips;

  NotificationElem({this.detail, this.defaultTips});

  NotificationElem.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    defaultTips = json['defaultTips'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['detail'] = detail;
    data['defaultTips'] = defaultTips;
    return data;
  }
}

/// Emoticon
class FaceElem {
  /// Position emoticon, user-defined embedded emoticon for peer-to-peer communication
  int? index;

  /// Other emoticons, such as URL emoticons directly returning the URL
  String? data;

  FaceElem({this.index, this.data});

  FaceElem.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index'] = index;
    data['data'] = this.data;
    return data;
  }
}

/// Additional Information
class AttachedInfoElem {
  /// Group message read information
  GroupHasReadInfo? groupHasReadInfo;

  /// Whether it is a private chat message (burn after reading message), valid for one-on-one chats
  bool? isPrivateChat;

  /// Read time
  int? hasReadTime;

  /// Reading duration in seconds
  /// That is, it triggers destruction after burnDuration seconds from the hasReadTime time
  int? burnDuration;

  /// Do not send offline push notifications
  bool? notSenderNotificationPush;

  AttachedInfoElem({
    this.groupHasReadInfo,
    this.isPrivateChat,
    this.hasReadTime,
    this.burnDuration,
    this.notSenderNotificationPush,
  });

  AttachedInfoElem.fromJson(Map<String, dynamic> json) {
    groupHasReadInfo = json['groupHasReadInfo'] == null ? null : GroupHasReadInfo.fromJson(json['groupHasReadInfo']);
    isPrivateChat = json['isPrivateChat'];
    hasReadTime = json['hasReadTime'];
    burnDuration = json['burnDuration'];
    notSenderNotificationPush = json['notSenderNotificationPush'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groupHasReadInfo'] = groupHasReadInfo?.toJson();
    data['isPrivateChat'] = isPrivateChat;
    data['hasReadTime'] = hasReadTime;
    data['burnDuration'] = burnDuration;
    data['notSenderNotificationPush'] = notSenderNotificationPush;
    return data;
  }
}

class TextElem {
  String? content;

  TextElem({this.content});

  TextElem.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = content;
    return data;
  }
}

class CardElem {
  String? userID;
  String? nickname;
  String? faceURL;
  String? ex;

  CardElem({this.userID, this.nickname, this.faceURL, this.ex});

  CardElem.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    nickname = json['nickname'];
    faceURL = json['faceURL'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['faceURL'] = faceURL;
    data['ex'] = ex;
    return data;
  }
}

class TypingElem {
  String? msgTips;

  TypingElem({this.msgTips});

  TypingElem.fromJson(Map<String, dynamic> json) {
    msgTips = json['msgTips'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msgTips'] = msgTips;
    return data;
  }
}

class AdvancedTextElem {
  String? text;
  List<MessageEntity>? messageEntityList;

  AdvancedTextElem({this.text, this.messageEntityList});

  AdvancedTextElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    messageEntityList = json['messageEntityList'] == null ? null : (json['messageEntityList'] as List).map((e) => MessageEntity.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['messageEntityList'] = messageEntityList?.map((e) => e.toJson()).toList();
    return data;
  }
}

class MessageEntity {
  String? type;
  int? offset;
  int? length;
  String? url;
  String? ex;

  MessageEntity({this.type, this.offset, this.length, this.url, this.ex});

  MessageEntity.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offset = json['offset'];
    length = json['length'];
    url = json['url'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['offset'] = offset;
    data['length'] = length;
    data['url'] = url;
    data['ex'] = ex;
    return data;
  }
}

/// Group message read information
class GroupHasReadInfo {
  /// Total number of reads
  int? hasReadCount;

  int? unreadCount;

  GroupHasReadInfo.fromJson(Map<String, dynamic> json) {
    hasReadCount = json['hasReadCount'] ?? 0;
    unreadCount = json['unreadCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hasReadCount'] = hasReadCount;
    data['unreadCount'] = unreadCount;
    return data;
  }
}

/// Message read receipt information
class ReadReceiptInfo {
  /// Sender ID
  String? userID;

  /// Group ID
  String? groupID;

  /// List of clientMsgIDs for read messages
  List<String>? msgIDList;

  /// Read time
  int? readTime;

  /// Message source
  int? msgFrom;

  /// Message type [MessageType]
  int? contentType;

  /// Conversation type [ConversationType]
  int? sessionType;

  ReadReceiptInfo({this.userID, this.groupID, this.msgIDList, this.readTime, this.msgFrom, this.contentType, this.sessionType});

  ReadReceiptInfo.fromJson(Map<String, dynamic> json) {
    userID = json['uid'] ?? json['userID'];
    groupID = json['groupID'];
    if (json['msgIDList'] is List) {
      msgIDList = (json['msgIDList'] as List).map((e) => '$e').toList();
    }
    readTime = json['readTime'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['msgIDList'] = msgIDList;
    data['readTime'] = readTime;
    data['msgFrom'] = msgFrom;
    data['contentType'] = contentType;
    data['sessionType'] = sessionType;
    return data;
  }
}

/// Offline push information
class OfflinePushInfo {
  /// Notification title
  String? title;

  /// Notification description
  String? desc;

  /// Extended content
  String? ex;

  /// iOS-specific
  String? iOSPushSound;

  /// iOS-specific
  bool? iOSBadgeCount;

  OfflinePushInfo({this.title, this.desc, this.ex, this.iOSPushSound, this.iOSBadgeCount});

  OfflinePushInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    ex = json['ex'];
    iOSPushSound = json['iOSPushSound'];
    iOSBadgeCount = json['iOSBadgeCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['ex'] = ex;
    data['iOSPushSound'] = iOSPushSound;
    data['iOSBadgeCount'] = iOSBadgeCount;
    return data;
  }
}

/// @ message user ID and nickname relationship object
class AtUserInfo {
  /// User ID who was @ mentioned
  String? atUserID;

  /// User nickname who was @ mentioned
  String? groupNickname;

  AtUserInfo({this.atUserID, this.groupNickname});

  AtUserInfo.fromJson(Map<String, dynamic> json) {
    atUserID = json['atUserID'];
    groupNickname = json['groupNickname'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['atUserID'] = atUserID;
    data['groupNickname'] = groupNickname;
    return data;
  }
}

/// Message revocation details
class RevokedInfo {
  /// Revoker's ID
  String? revokerID;

  /// Revoker's group role [GroupRoleLevel]
  int? revokerRole;

  /// Revoker's nickname
  String? revokerNickname;

  /// Message ID
  String? clientMsgID;

  /// Revocation time
  int? revokeTime;

  /// Message sending time
  int? sourceMessageSendTime;

  /// Message sender
  String? sourceMessageSendID;

  /// Message sender's nickname
  String? sourceMessageSenderNickname;

  /// Conversation type [ConversationType]
  int? sessionType;

  RevokedInfo({
    this.revokerID,
    this.revokerRole,
    this.revokerNickname,
    this.clientMsgID,
    this.revokeTime,
    this.sourceMessageSendTime,
    this.sourceMessageSendID,
    this.sourceMessageSenderNickname,
    this.sessionType,
  });

  RevokedInfo.fromJson(Map<String, dynamic> json) {
    revokerID = json['revokerID'];
    revokerRole = json['revokerRole'];
    revokerNickname = json['revokerNickname'];
    clientMsgID = json['clientMsgID'];
    revokeTime = json['revokeTime'];
    sourceMessageSendTime = json['sourceMessageSendTime'];
    sourceMessageSendID = json['sourceMessageSendID'];
    sourceMessageSenderNickname = json['sourceMessageSenderNickname'];
    sessionType = json['sessionType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['revokerID'] = revokerID;
    data['revokerRole'] = revokerRole;
    data['revokerNickname'] = revokerNickname;
    data['clientMsgID'] = clientMsgID;
    data['revokeTime'] = revokeTime;
    data['sourceMessageSendTime'] = sourceMessageSendTime;
    data['sourceMessageSendID'] = sourceMessageSendID;
    data['sourceMessageSenderNickname'] = sourceMessageSenderNickname;
    data['sessionType'] = sessionType;
    return data;
  }
}

class AdvancedMessage {
  List<Message>? messageList;
  bool? isEnd;
  int? errCode;
  String? errMsg;
  int? lastMinSeq;

  AdvancedMessage({
    this.messageList,
    this.isEnd,
    this.errCode,
    this.errMsg,
    this.lastMinSeq,
  });

  AdvancedMessage.fromJson(Map<String, dynamic> json) {
    messageList = json['messageList'] == null ? null : (json['messageList'] as List).map((e) => Message.fromJson(e)).toList();
    isEnd = json['isEnd'];
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    lastMinSeq = json['lastMinSeq'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['messageList'] = messageList?.map((e) => e.toJson()).toList();
    data['isEnd'] = isEnd;
    data['errCode'] = errCode;
    data['errMsg'] = errMsg;
    data['lastMinSeq'] = lastMinSeq;
    return data;
  }
}

class RichMessageInfo {
  String? type;
  int? offset;
  int? length;
  String? url;
  String? info;

  RichMessageInfo({
    this.type,
    this.offset,
    this.length,
    this.url,
    this.info,
  });

  RichMessageInfo.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    offset = json['offset'];
    length = json['length'];
    url = json['url'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['offset'] = offset;
    data['length'] = length;
    data['url'] = url;
    data['info'] = info;
    return data;
  }
}

class UserExInfo {
  String? userID;
  String? ex;

  UserExInfo({this.userID, this.ex});

  UserExInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['ex'] = ex;
    return data;
  }
}
