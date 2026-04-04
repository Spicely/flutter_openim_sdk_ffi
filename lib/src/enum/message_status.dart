

/// Message Send Status
enum MessageStatus {
  none(0),

  sending(1),

  succeeded(2),

  failed(3),

  deleted(4);

  final int rawValue;

  const MessageStatus(this.rawValue);

  static MessageStatus? fromRawValue(int? value) {
    return MessageStatus.values.firstWhere(
      (status) => status.rawValue == value,
      orElse: () => MessageStatus.none,
    );
  }
}

enum GetHistoryViewType {
  history(0),
  search(1);

  final int rawValue;

  const GetHistoryViewType(this.rawValue);
}
