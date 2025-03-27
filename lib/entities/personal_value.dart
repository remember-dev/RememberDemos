import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/entities/base_entity.dart';
import 'package:remember_demos/widgets/utils.dart';

class PersonalValue extends BaseEntity<PersonalValue> {
  String title;
  final String description;
  final Color color;
  final bool customValue;
  final Guid? userId;
  final Guid categoryId;

  PersonalValue({
    required super.id,
    required super.lastModified,
    required this.title,
    required this.description,
    required this.color,
    required this.customValue,
    this.userId,
    required this.categoryId,
  });

  static PersonalValue fromMap(map) {
    map = normalizeMap(map);
    return PersonalValue(
      id: Guid(map['id']),
      lastModified: DateTime.parse(map['lastmodified']),
      title: map['title'],
      description: map['description'],
      color: map['color'],
      customValue: getBoolFromIntOrBool(map['customvalue']),
      userId: map['userid'] == null ? null : Guid(map['userid']),
      categoryId: Guid(map['categoryid']),
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'title': title,
      'description': description,
      'color': colorToHex(color),
      'customValue': customValue ? 1 : 0,
      'userId': userId?.toString().toUpperCase(),
      'categoryId': categoryId.toString().toUpperCase(),
    };
  }

  @override
  PersonalValue clone() => fromMap(toMap());
}
