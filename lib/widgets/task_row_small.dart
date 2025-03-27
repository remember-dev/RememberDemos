import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/utils.dart';

TaskRowSmall randomSmallTaskRow(Key k,
    {String? title, Color? color, int? priority}) {
  return TaskRowSmall.fromBasicTask(randomBasicTask(
    taskTitle: title,
    priority: priority,
    color: color,
  ));
}

class TaskRowSmall extends StatelessWidget {
  final String title;
  // final String subtitle;
  final Color color;
  final int priority;
  final DateTime? scheduledTime;
  final bool completed;
  final bool allDayTask;
  final bool forceOffScheduledTime;
  final double? customSize;

  const TaskRowSmall({
    super.key,
    required this.title,
    required this.color,
    required this.priority,
    this.scheduledTime,
    this.completed = false,
    this.allDayTask = false,
    this.forceOffScheduledTime = false,
    this.customSize,
  });

  static TaskRowSmall fromBasicTask(BasicTask task,
      {bool forceOffScheduledTime = false, double? customSize}) {
    return TaskRowSmall(
      title: task.taskTitle,
      color: task.color,
      priority: task.priority,
      scheduledTime: task.scheduledTime,
      completed: task.completed,
      allDayTask: task.isAllDay,
      forceOffScheduledTime: forceOffScheduledTime,
      customSize: customSize,
    );
  }

  TaskRowSmall copyWith({
    String? title,
    String? subtitle,
    Color? color,
    int? priority,
  }) {
    return TaskRowSmall(
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
          color: RememberColors.white,
          border: Border(left: BorderSide(color: color, width: 12)),
        ),
        margin: EdgeInsets.all(2),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Row(
            children: [
              SizedBox.square(
                dimension: customSize ?? 20,
                child: Checkbox.adaptive(
                  value: completed,
                  onChanged: (value) {
                    // completed = value ?? false; // TODO
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(title, style: regularPrimary),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _priorityLabel(),
                  if (scheduledTime != null &&
                      !allDayTask &&
                      !forceOffScheduledTime)
                    Text(
                      DateFormat('E MMM d h:mm a').format(scheduledTime!),
                      style: regularPrimary.copyWith(fontSize: 12),
                    ),
                  if (scheduledTime != null &&
                      allDayTask &&
                      !forceOffScheduledTime)
                    Text(
                      DateFormat('E MMM d').format(scheduledTime!),
                      style: regularPrimary.copyWith(fontSize: 12),
                    ),
                ],
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

    return Text(text,
        style: semiBoldPrimary.copyWith(color: color, fontSize: 12));
  }
}
