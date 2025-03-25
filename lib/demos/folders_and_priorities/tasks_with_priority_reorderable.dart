import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:remember_demos/widgets/task_row.dart';

class TasksWithPriorityDD extends StatefulWidget {
  const TasksWithPriorityDD({super.key});

  @override
  State<TasksWithPriorityDD> createState() => _TasksWithPriorityDDState();
}

class _TasksWithPriorityDDState extends State<TasksWithPriorityDD> {
  List<TaskRow> tasks = List.generate(10, (i) => randomTaskRow(ValueKey(i)))
    ..sort((t1, t2) => t1.priority - t2.priority);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        child: Center(
          child: DragAndDropLists(
            children: [
              DragAndDropList(
                canDrag: false,
                children: tasks.map((t) => DragAndDropItem(child: t)).toList(),
              ),
            ],
            onListReorder: (_, __) {},
            onItemReorder: (start, _, end, __) => onReorder(start, end),
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
