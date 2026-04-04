

/// 当前flutter平台仅支持Android/ios
enum IMPlatform {
  ios(1),

  android(2),
  windows(3),
  xos(4),
  web(5),
  miniWeb(6),
  linux(7),
  androidPad(8),
  ipad(9);

  final int rawValue;

  const IMPlatform(this.rawValue);
}
