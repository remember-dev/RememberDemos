import 'package:flutter/material.dart';
import 'package:remember_demos/widgets/task_row.dart';

class TasksWithPriority extends StatefulWidget {
  const TasksWithPriority({super.key});

  @override
  State<TasksWithPriority> createState() => _TasksWithPriorityState();
}

class _TasksWithPriorityState extends State<TasksWithPriority> {
  List<TaskRow> tasks = List.generate(10, (i) => randomTaskRow(ValueKey(i)))
    ..sort((t1, t2) => t1.priority - t2.priority);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 36, 12),
        child: Center(
          child: ReorderableListView.builder(
            itemCount: tasks.length,
            itemBuilder: (_, i) => ReorderableDragStartListener(
              key: ValueKey(i),
              index: i,
              child: tasks[i],
            ),
            onReorder: onReorder,
          ),
        ),
      ),
    );
  }

  void onReorder(int start, int end) {
    setState(() {
      if (end > start) end--;

      // Update the task priority if needed
      if (tasks[end].priority != tasks[start].priority) {
        tasks[start] = tasks[start].copyWith(priority: tasks[end].priority);
      }

      tasks.insert(end, tasks.removeAt(start));
    });
  }
}
