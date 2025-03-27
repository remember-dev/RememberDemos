import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/entities/base_entity.dart';
import 'package:remember_demos/widgets/utils.dart';

class Category extends BaseEntity<Category> {
  final String title;
  final Color color;
  final int position;

  Category({
    required super.id,
    required super.lastModified,
    required this.title,
    required this.color,
    required this.position,
  });

  static Category fromMap(map) {
    map = normalizeMap(map);
    return Category(
      id: Guid(map['id']),
      lastModified: DateTime.parse(map['lastmodified']),
      title: map['title'],
      color: map['color'],
      position: map['position'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'title': title,
      'color': colorToHex(color),
      'position': position
    };
  }

  @override
  Category clone() => fromMap(toMap());
}
