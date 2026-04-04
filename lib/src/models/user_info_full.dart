

class UserInfoFull {
  final String account;

  final int allowAddFriend;

  final int allowBeep;

  final int allowVibration;

  final String areaCode;

  final int birth;

  final String email;

  final String faceURL;

  final int gender;

  final int globalRecvMsgOpt;

  final int level;

  final String nickname;

  final String password;

  final String phoneNumber;

  final String userID;

  UserInfoFull({
    required this.account,
    required this.allowAddFriend,
    required this.allowBeep,
    required this.allowVibration,
    required this.areaCode,
    required this.birth,
    required this.email,
    required this.faceURL,
    required this.gender,
    required this.globalRecvMsgOpt,
    required this.level,
    required this.nickname,
    required this.password,
    required this.phoneNumber,
    required this.userID,
  });

  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'allowAddFriend': allowAddFriend,
      'allowBeep': allowBeep,
      'allowVibration': allowVibration,
      'areaCode': areaCode,
      'birth': birth,
      'email': email,
      'faceURL': faceURL,
      'gender': gender,
      'globalRecvMsgOpt': globalRecvMsgOpt,
      'level': level,
      'nickname': nickname,
      'password': password,
      'phoneNumber': phoneNumber,
      'userID': userID,
    };
  }

  factory UserInfoFull.fromJson(dynamic data) {
    return UserInfoFull(
      account: data['account'],
      allowAddFriend: data['allowAddFriend'],
      allowBeep: data['allowBeep'],
      allowVibration: data['allowVibration'],
      areaCode: data['areaCode'],
      birth: data['birth'],
      email: data['email'],
      faceURL: data['faceURL'],
      gender: data['gender'],
      globalRecvMsgOpt: data['globalRecvMsgOpt'],
      level: data['level'],
      nickname: data['nickname'],
      password: data['password'],
      phoneNumber: data['phoneNumber'],
      userID: data['userID'],
    );
  }

  static List<UserInfoFull> toArray(List<dynamic> data) {
    return data.map((i) => UserInfoFull.fromJson(i)).toList();
  }
}
