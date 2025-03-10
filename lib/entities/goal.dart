import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/entities/base_entity.dart';

class Goal extends BaseEntity<Goal> {
  final Guid valueId;
  final String title;
  final String description;
  final Color color;
  final bool customGoal;
  final Guid? userId;
  final bool completed;

  Goal({
    required super.id,
    required super.lastModified,
    required this.valueId,
    required this.title,
    required this.description,
    required this.color,
    required this.customGoal,
    required this.userId,
    required this.completed,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'valueId': valueId.toString(),
      'title': title,
      'description': description,
      'color': color,
      'customGoal': customGoal,
      'userId': userId?.toString(),
      'completed': completed,
    };
  }

  static Goal fromMap(map) {
    map = normalizeMap(map);
    return Goal(
      id: Guid(map['id']),
      lastModified: DateTime.parse(map['lastmodified']),
      valueId: Guid(map['valueid']),
      title: map['title'],
      description: map['description'],
      color: map['color'],
      customGoal: getBoolFromIntOrBool(map['customgoal']),
      userId: map['userid'] == null ? null : Guid(map['userid']),
      completed: getBoolFromIntOrBool(map['completed']),
    );
  }

  @override
  Goal clone() => fromMap(toMap());
}
