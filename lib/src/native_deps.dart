// Stub file for native platform dependencies.
// This file is imported on native platforms via conditional imports.

import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:isolate';

import 'package:ffi/ffi.dart';
import 'package:path_provider/path_provider.dart';

import '../flutter_openim_sdk_ffi_bindings_generated.dart';

export 'dart:ffi';
export 'dart:io' show Platform, Directory;
export 'dart:isolate';

export 'package:ffi/ffi.dart';
export 'package:path_provider/path_provider.dart';

export '../flutter_openim_sdk_ffi_bindings_generated.dart';

/// Flag indicating native platform
const bool isNativePlatform = true;
