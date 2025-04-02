import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/utils.dart';

TaskRow randomTaskRow(Key k, {String? title, Color? color, int? priority}) {
  return TaskRow.fromBasicTask(randomBasicTask(
    taskTitle: title,
    priority: priority,
    color: color,
  ));
}

class TaskRow extends StatelessWidget {
  final String title;
  // final String subtitle;
  final Color color;
  final int priority;
  final DateTime? scheduledTime;
  final int? duration;
  final bool completed;
  final bool allDayTask;
  final bool forceOffScheduledTime;
  final bool showStartAndEndTimes;

  const TaskRow({
    super.key,
    required this.title,
    required this.color,
    required this.priority,
    this.scheduledTime,
    this.duration,
    this.completed = false,
    this.allDayTask = false,
    this.forceOffScheduledTime = false,
    this.showStartAndEndTimes = false,
  });

  static TaskRow fromBasicTask(BasicTask task,
      {bool forceOffScheduledTime = false, bool showStartAndEndTimes = false}) {
    return TaskRow(
      title: task.taskTitle,
      color: task.color,
      priority: task.priority,
      scheduledTime: task.scheduledTime,
      completed: task.completed,
      allDayTask: task.isAllDay,
      forceOffScheduledTime: forceOffScheduledTime,
      showStartAndEndTimes: showStartAndEndTimes,
    );
  }

  TaskRow copyWith({
    String? title,
    String? subtitle,
    Color? color,
    int? priority,
  }) {
    return TaskRow(
      title: title ?? this.title,
      color: color ?? this.color,
      priority: priority ?? this.priority,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color, width: 12)),
        ),
        margin: EdgeInsets.all(2),
        child: ListTile(
          // visualDensity: VisualDensity(vertical: allDayTask ? -4 : 0),
          tileColor: Colors.white,
          contentPadding: EdgeInsets.only(right: 12),
          leading: Checkbox.adaptive(
              value: completed,
              onChanged: (value) {
                // completed = value ?? false; // TODO
              }),
          title: Text(title, style: regularPrimary),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _priorityLabel(),
              if (scheduledTime != null &&
                  !allDayTask &&
                  !forceOffScheduledTime)
                Text(
                  DateFormat('E MMM d h:mm a').format(scheduledTime!),
                  style: regularPrimary,
                ),
              if (scheduledTime != null && allDayTask && !forceOffScheduledTime)
                Text(
                  DateFormat('E MMM d').format(scheduledTime!),
                  style: regularPrimary,
                ),
              if (showStartAndEndTimes)
                Text(
                  "${DateFormat('h:mm a').format(scheduledTime!)} - ${DateFormat('h:mm a').format(scheduledTime!.add(Duration(minutes: duration ?? 60)))}",
                  style: regularPrimary,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _priorityLabel() {
    String text = switch (priority) {
      0 => "HIGH",
      1 => "MID",
      _ => "LOW",
    };
    final color = switch (priority) {
      0 => Colors.red,
      1 => Colors.amber,
      _ => Colors.blue,
    };

    return Text(text, style: semiBoldPrimary.copyWith(color: color));
  }
}
