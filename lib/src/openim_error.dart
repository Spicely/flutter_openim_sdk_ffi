
/*
 * Summary: 错误信息
 * Created Date: 2023-07-02 20:49:10
 * Author: Spicely
 * -----
 * Last Modified: 2023-08-03 14:47:25
 * Modified By: Spicely
 * -----
 * Copyright (c) 2023 Spicely Inc.
 * 
 * May the force be with you.
 * -----
 * HISTORY:
 * Date      	By	Comments
 */

class OpenIMError extends Error {
  final int code;

  final String message;

  final String? methodName;

  OpenIMError(this.code, this.message, {this.methodName});

  @override
  String toString() => 'error: $code, message: $message, method: $methodName';
}
