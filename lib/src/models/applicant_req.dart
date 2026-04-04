

class GetGroupApplicationListAsApplicantReq {
  final List<String> groupIDs;
  final List<int> handleResults;
  final int offset;
  final int count;

  GetGroupApplicationListAsApplicantReq({
    required this.groupIDs,
    required this.handleResults,
    required this.offset,
    required this.count,
  });

  factory GetGroupApplicationListAsApplicantReq.fromJson(Map<String, dynamic> json) {
    return GetGroupApplicationListAsApplicantReq(
      groupIDs: List<String>.from(json['groupIDs'] ?? []),
      handleResults: List<int>.from(json['handleResults'] ?? []),
      offset: json['offset'] ?? 0,
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'groupIDs': groupIDs,
      'handleResults': handleResults,
      'offset': offset,
      'count': count,
    };
  }
}

class GetFriendApplicationListAsRecipientReq {
  final List<int> handleResults;
  final int offset;
  final int count;

  GetFriendApplicationListAsRecipientReq({
    required this.handleResults,
    required this.offset,
    required this.count,
  });

  factory GetFriendApplicationListAsRecipientReq.fromJson(Map<String, dynamic> json) {
    return GetFriendApplicationListAsRecipientReq(
      handleResults: List<int>.from(json['handleResults'] ?? []),
      offset: json['offset'] ?? 0,
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'handleResults': handleResults,
      'offset': offset,
      'count': count,
    };
  }
}

class GetFriendApplicationListAsApplicantReq {
  final int offset;
  final int count;

  GetFriendApplicationListAsApplicantReq({
    required this.offset,
    required this.count,
  });

  factory GetFriendApplicationListAsApplicantReq.fromJson(Map<String, dynamic> json) {
    return GetFriendApplicationListAsApplicantReq(
      offset: json['offset'] ?? 0,
      count: json['count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'count': count,
    };
  }
}
