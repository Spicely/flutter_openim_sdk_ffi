import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:isolate';

import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'flutter_openim_sdk_ffi_bindings_generated.dart';
import 'src/utils.dart';

// Shared types (models, enums, error, listener)
export 'src/shared_types.dart';
import 'src/shared_types.dart';

/// callback (native only)
part 'src/callback/_error.dart';
part 'src/callback/_listen.dart';
part 'src/callback/_listen_to_class.dart';
part 'src/callback/_method.dart';
part 'src/callback/_success.dart';

/// _PortMethod enum (native only — private class)
part 'src/enum/_port_method.dart';

/// native manager implementations
part 'src/manager/im_conversation_manager.dart';
part 'src/manager/im_friendship_manager.dart';
part 'src/manager/im_group_manager.dart';
part 'src/manager/im_manager.dart';
part 'src/manager/im_message_manager.dart';
part 'src/manager/im_user_manager.dart';

/// native-only models (_PortModel, _PortResult, _IMManager, etc.)
part 'src/models/openim.dart';

/// root
part 'src/openim.dart';
part 'src/openim_manager.dart';
