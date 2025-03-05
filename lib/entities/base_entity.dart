import 'dart:convert';

import 'package:flutter_guid/flutter_guid.dart';

abstract class BaseEntity<T> {
  final Guid id;
  DateTime lastModified;

  BaseEntity({required this.id, required this.lastModified});

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'lastModified': lastModified.toIso8601String(),
    };
  }

  /// Returns a string representation of the object for debugging purposes.
  /// `<Type name>::<JSON string of the object>`
  @override
  String toString() {
    return "${T.toString()}::${jsonEncode(toMap())}";
  }

  /// Returns a new object of type `T` with all the same values and a different
  /// hashCode. This function helps avoid accidental mutation of data.
  T clone();
}

/// Lowercase all the keys in the map so that we can use `toMap()` for Database
/// and Api calls. This function returns a **NEW MAP!**
///
/// Example:
/// ```
/// var map = {
///   "Id": "thisIsAnId",
///   "LastModified": "yesterDay",
/// };
/// var newMap = normalizeMap(map);
/// print(newMap.keys); // Output: ["id", "lastmodified"]
/// ```
Map<String, dynamic> normalizeMap(Map<String, dynamic> map) {
  return map.map((k, v) => MapEntry(k.toLowerCase(), v));
}

/// Helper function meant to be used with `fromMap` in any BaseEntity.
/// Useful when the database returns ints, but the dart type is bool. Use this
/// when you know the type will be `int` or `bool`, but you don't know which.
bool getBoolFromIntOrBool(dynamic value) {
  assert(
    value is int || value is bool,
    "The value $value is not an int or bool! ${value.runtimeType}",
  );

  if (value is bool) return value;
  return value != 0;
}
