import 'dart:convert';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

// Conditionally import JS interop for web support
class IMUtils {
  static List<T> toList<T>(dynamic value, T Function(Map<String, dynamic> map) f) {
    final decoded = _ensureDecoded(value);
    if (decoded is List) {
      return decoded.map((e) {
        if (e is Map<String, dynamic>) return f(e);
        if (e is Map) return f(Map<String, dynamic>.from(e));
        if (e is String) return f(jsonDecode(e) as Map<String, dynamic>);
        return f(e as Map<String, dynamic>);
      }).toList();
    }
    return [];
  }

  static T toObj<T>(dynamic value, T Function(Map<String, dynamic> map) f) {
    final decoded = _ensureDecoded(value);
    if (decoded is Map<String, dynamic>) return f(decoded);
    if (decoded is Map) return f(Map<String, dynamic>.from(decoded));
    if (decoded is String) return f(jsonDecode(decoded) as Map<String, dynamic>);
    return f(decoded as Map<String, dynamic>);
  }

  static List<dynamic> toListMap(dynamic value) {
    final decoded = _ensureDecoded(value);
    return decoded is List ? decoded : [];
  }

  static dynamic formatJson(String value) => jsonDecode(value);

  /// Ensures the value is decoded from JSON string if needed.
  /// Handles String (JSON), Map/List (already decoded), and raw JS types.
  static dynamic _ensureDecoded(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      try {
        return jsonDecode(value);
      } catch (_) {
        return value;
      }
    }
    if (value is Map || value is List || value is num || value is bool) {
      return value;
    }
    // For any other type (including JSAny/JSArray/JSObject from web),
    // try to convert via toString then JSON decode
    try {
      final str = value.toString();
      return jsonDecode(str);
    } catch (_) {
      return value;
    }
  }

  static String checkOperationID(String? obj) => obj ?? uuid.v4();
}
