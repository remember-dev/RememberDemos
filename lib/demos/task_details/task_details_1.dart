import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';

class TaskDetails1 extends StatefulWidget {
  const TaskDetails1({
    super.key,
    required Guid categoryId,
    required Guid goalId,
  });

  @override
  State<TaskDetails1> createState() => _TaskDetails1State();
}

class _TaskDetails1State extends State<TaskDetails1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
