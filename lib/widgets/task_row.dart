import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/text_styles.dart';

const colors = [
  Color(0xFF73C0FF), // 0
  Color(0xFFFF9EC3), // 1
  Color(0xFF92EA92), // 2
  Color(0xFF90FCEA), // 3
  Color(0xFFFFC400), // 4
  Color(0xFFFFF466), // 5
  Color(0xFFE7D79C), // 6
  Color(0xFFBCA2ED), // 7
  Color(0xFFDADADA), // 8
];
const titles = [
  "Test 1",
  "Test 2",
  "Test 3",
  "Clean the car",
  "Vaccum the living room",
  "Build a mobile app",
  "Market a mobile app",
  "Call my best friend",
  "Go camping",
  "Setup Chat GPT to pour the perfect amount of milk in my Wheaties",
  "BYU Basketball is awesome",
  "Make mac & cheese for a 10 year old",
  "Read that one book",
  "Cancel Netflix subscription",
  "Do a 360 on skis",
  "Send funny memes to my friend",
];

Random random = Random();

TaskRow randomTaskRow(Key k, {String? title, Color? color, int? priority}) {
  return TaskRow(
    key: k,
    title: title ?? titles[random.nextInt(titles.length)],
    color: color ?? colors[random.nextInt(colors.length)],
    priority: priority ?? random.nextInt(3),
  );
}

class TaskRow extends StatelessWidget {
  final String title;
  // final String subtitle;
  final Color color;
  final int priority;
  final DateTime? scheduledTIme;
  final bool completed;

  TaskRow({
    super.key,
    required this.title,
    required this.color,
    required this.priority,
    this.scheduledTIme,
    this.completed = false,
  });

  static TaskRow fromBasicTask(BasicTask task) {
    return TaskRow(
      title: task.taskTitle,
      color: task.color,
      priority: task.priority,
      scheduledTIme: task.scheduledTime,
      completed: task.completed,
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
              if (scheduledTIme != null)
                Text(
                  DateFormat('E MMM d h:mm a').format(scheduledTIme!),
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
