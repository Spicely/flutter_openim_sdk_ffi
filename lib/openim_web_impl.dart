/// Web implementation of the OpenIM SDK.
///
/// This is the web-specific library that mirrors the structure of
/// flutter_openim_sdk_ffi.dart but avoids dart:ffi, dart:io, and dart:isolate.
/// It uses WASM + JS Interop instead.
///
/// Consumer apps should use conditional imports:
/// ```dart
/// import 'package:flutter_openim_sdk_ffi/flutter_openim_sdk_ffi.dart'
///     if (dart.library.js_interop) 'package:flutter_openim_sdk_ffi/openim_web_impl.dart';
/// ```
library;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:flutter/foundation.dart';


import 'src/utils.dart';
import 'src/web/js_bindings.dart';
import 'src/web/wasm_loader.dart';
import 'src/web/web_event_handler.dart';

// Shared types (models, enums, error, listener)
export 'src/shared_types.dart';
import 'src/shared_types.dart';

// ==========================================
// Web-specific implementation (part files)
// ==========================================
part 'src/web/openim_web_models.dart';
part 'src/web/openim_web_core.dart';
part 'src/web/openim_web_manager.dart';
part 'src/web/openim_web_listen.dart';
part 'src/web/openim_web_method.dart';
part 'src/web/openim_web_success.dart';
part 'src/web/manager/im_manager_web.dart';
part 'src/web/manager/im_conversation_manager_web.dart';
part 'src/web/manager/im_message_manager_web.dart';
part 'src/web/manager/im_friendship_manager_web.dart';
part 'src/web/manager/im_group_manager_web.dart';
part 'src/web/manager/im_user_manager_web.dart';
