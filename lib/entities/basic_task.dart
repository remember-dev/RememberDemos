import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/entities/base_entity.dart';

class BasicTask extends BaseEntity<BasicTask> {
  Guid userId;

  /// The scheduled date for the task. (When the task is scheduled for in the
  /// calendar and on the app)
  DateTime? scheduledTime;

  /// The scheduled duration in minutes. Ex: 2 hours = 120 minutes.
  int? scheduledDuration;

  String taskTitle;
  bool completed;
  DateTime? dateCompleted;
  bool archived;
  bool isDeleted;
  final bool isGoalTask;
  bool isDelegatedTask;
  Guid? goalId;
  final Color color;
  int priority;
  @Deprecated("Aren't we getting rid of this field eventually?")
  DateTime? dueDate;
  Guid? folderId;
  int orderGroup;
  String? recurranceType;
  int taskType;

  /// This is a calendar specific eventId used to tie basicTask objects with the
  /// calendar and retrieve & update information in the user's calendar.
  /// This eventId should be a `String` that contains the ID portion of the
  /// [Event.externalEventId] from the forked device_calendar package.
  ///
  /// https://github.com/builttoroam/device_calendar/issues/509
  String? eventId;
  Guid? parentTask;

  bool get isRecurringTask => recurranceType != null;
  bool get isChildTask => parentTask != null;
  bool get isAllDay => taskType == 0;
  bool isOwnedByMe(String myUserId) => userId.toString() == myUserId;

  /// Returns `true` only if `this` is due on [day] (day, month, and year).
  bool isDueOnDay(DateTime day) {
    return dueDate != null &&
        dueDate!.day == day.day &&
        dueDate!.month == day.month &&
        dueDate!.year == day.year;
  }

  /// Returns `true` only if task is scheduled for [day] (day, month, and year).
  bool isScheduledForDay(DateTime day) {
    return scheduledTime != null &&
        scheduledTime!.day == day.day &&
        scheduledTime!.month == day.month &&
        scheduledTime!.year == day.year;
  }

  BasicTask({
    required super.id,
    required super.lastModified,
    required this.userId,
    required this.scheduledTime,
    this.scheduledDuration,
    required this.taskTitle,
    required this.completed,
    this.dateCompleted,
    required this.archived,
    required this.isDeleted,
    required this.isGoalTask,
    required this.isDelegatedTask,
    Guid? goalId,
    required this.color,
    required this.priority,
    this.dueDate,
    this.folderId,
    required this.orderGroup,
    this.recurranceType,
    this.eventId,
    this.parentTask,
    this.taskType = 0, // Default to Master List
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'userId': userId.toString(),
      'scheduledTime': scheduledTime?.toIso8601String(),
      'scheduledDuration': scheduledDuration,
      'taskTitle': taskTitle,
      'completed': completed,
      'dateCompleted': dateCompleted?.toIso8601String(),
      'archived': archived,
      'isDeleted': isDeleted,
      'isGoalTask': isGoalTask,
      'isDelegatedTask': isDelegatedTask,
      'goalId': goalId?.toString(),
      'color': color,
      'priority': priority,
      'orderGroup': orderGroup,
      "dueDate": dueDate?.toUtc().toIso8601String(),
      "folderId": folderId?.toString(),
      "recurranceType": recurranceType,
      "eventId": eventId,
      "parentTask": parentTask?.toString(),
      "taskType": taskType,
    };
  }

  static BasicTask fromMap(map) {
    map = normalizeMap(map);
    return BasicTask(
      id: Guid(map['id']),
      lastModified: DateTime.parse(map['lastmodified']),
      userId: Guid(map['userid']),
      scheduledTime: map['scheduledtime'] != null
          ? DateTime.parse(map['scheduledtime'])
          : null,
      scheduledDuration: map['scheduledduration'],
      taskTitle: map['tasktitle'],
      completed: getBoolFromIntOrBool(map['completed']),
      dateCompleted: map['datecompleted'] != null
          ? DateTime.parse(map['datecompleted'])
          : null,
      archived: getBoolFromIntOrBool(map['archived']),
      isDeleted: getBoolFromIntOrBool(map['isdeleted']),
      isGoalTask: getBoolFromIntOrBool(map['isgoaltask']),
      isDelegatedTask: getBoolFromIntOrBool(map['isdelegatedtask']),
      goalId: map['goalid'] != null ? Guid(map['goalid']) : null,
      color: map['color'],
      priority: map['priority'],
      orderGroup: map['ordergroup'],
      dueDate: map['duedate'] != null ? DateTime.parse(map['duedate']) : null,
      recurranceType: map['recurrancetype'],
      eventId: map['eventid'],
      parentTask: map['parenttask'] != null ? Guid(map['parenttask']) : null,
      folderId: map['folderid'] != null ? Guid(map['folderid']) : null,
      taskType: map['tasktype'],
    );
  }

  @override
  BasicTask clone() => fromMap(toMap());
}
