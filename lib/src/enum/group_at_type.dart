

/// 会话强提示内容
enum GroupAtType {
  /// 取消所有提示，即调用了resetConversationGroupAtType方法
  atNormal(0),

  /// @了我提示
  atMe(1),

  /// @了所有人提示
  atAll(2),

  /// @了所有人@了我
  atAllAtMe(3),

  /// 群公告提示
  groupNotification(4);

  final int rawValue;

  const GroupAtType(this.rawValue);
}
