part of '../../flutter_openim_sdk_ffi_native.dart';

class _PortResult<T> {
  final T? data;

  final String? error;

  final int? errCode;

  final String? callMethodName;

  _PortResult({
    this.data,
    this.error,
    this.errCode,
    this.callMethodName,
  });

  T get value {
    if (error != null) {
      throw OpenIMError(errCode!, error!, methodName: callMethodName);
    }
    return data!;
  }
}

class _PortModel {
  final String method;

  dynamic data;

  final SendPort? sendPort;

  final dynamic errCode;

  final String? operationID;

  final String? callMethodName;

  _PortModel({
    required this.method,
    this.data,
    this.sendPort,
    this.errCode,
    this.operationID,
    this.callMethodName,
  });

  factory _PortModel.fromJson(Map<String, dynamic> json) => _PortModel(
        method: json['method'] as String,
        data: json['data'],
        errCode: json['errCode'],
        operationID: json['operationID'] as String?,
        callMethodName: json['callMethodName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'method': method,
        'data': data,
        'errCode': errCode,
        'operationID': operationID,
        'callMethodName': callMethodName,
      };
}

class _IsolateTaskData<T> {
  final SendPort sendPort;

  RootIsolateToken? rootIsolateToken;

  final T data;

  _IsolateTaskData(this.sendPort, this.data, this.rootIsolateToken);
}

class _InitSdkParams {
  final String apiAddr;
  final String wsAddr;
  final String? dataDir;

  final int logLevel;

  final String? operationID;

  final bool isLogStandardOutput;
  final String? logFilePath;
  final bool isExternalExtensions;

  _InitSdkParams({
    required this.apiAddr,
    required this.wsAddr,
    this.logLevel = 6,
    this.dataDir,
    this.operationID,
    this.isLogStandardOutput = false,
    this.logFilePath,
    this.isExternalExtensions = false,
  });
}

class _IMManager {
  /// 主进程通信端口
  final ReceivePort receivePort;

  final Isolate isolate;

  final SendPort isolatePort;

  _IMManager({
    required this.receivePort,
    required this.isolate,
    required this.isolatePort,
  });
}
