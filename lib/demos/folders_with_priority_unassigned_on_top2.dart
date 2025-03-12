import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/utils.dart';

class FoldersWithPriorityUnscheduledOnTop2 extends StatefulWidget {
  const FoldersWithPriorityUnscheduledOnTop2({super.key});

  @override
  State<FoldersWithPriorityUnscheduledOnTop2> createState() =>
      _FoldersWithPriorityUnscheduledOnTop2State();
}

class _FoldersWithPriorityUnscheduledOnTop2State
    extends State<FoldersWithPriorityUnscheduledOnTop2> {
  List<List<TaskRow>> lists = [
    List.generate(
        10,
        (i) => randomTaskRow(ValueKey(i),
            title: "Task $i",
            color: taskColors[i % taskColors.length],
            priority: i ~/ 4 % 3))
      ..sort((t1, t2) => t1.priority - t2.priority),
    [
      TaskRow(title: "Charlotte's Web", color: taskColors[1], priority: 0),
      TaskRow(title: "Harry Potter", color: taskColors[4], priority: 1),
      TaskRow(title: "Atomic Habits", color: taskColors[2], priority: 2),
    ],
    [
      TaskRow(title: "Lego Batman", color: taskColors[0], priority: 0),
      TaskRow(title: "Apollo 13", color: taskColors[7], priority: 0),
      TaskRow(title: "Lord of the Rings", color: taskColors[6], priority: 1),
      TaskRow(title: "12 Angry Men", color: taskColors[3], priority: 1),
      TaskRow(title: "Indiana Jones", color: taskColors[8], priority: 2),
      TaskRow(title: "Jurrasic Park", color: taskColors[5], priority: 2),
    ],
  ];

  List<TaskRow> get unscheduledTasks => lists[0];
  List<TaskRow> get booksTasks => lists[1];
  List<TaskRow> get moviesTasks => lists[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unscheduled Tasks"),
        centerTitle: true,
      ),
      body: Center(
        child: DragAndDropLists(
          onItemReorder: onReorderLists,
          onListReorder: (_, __) {},
          children: [
            // The Unscheduled
            DragAndDropList(
              canDrag: false,
              header: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Unscheduled",
                  style: semiBoldSecondary.copyWith(fontSize: 18),
                ),
              ),
              children: unscheduledTasks
                  .map((t) => DragAndDropItem(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 36, 0),
                        child: t,
                      )))
                  .toList(),
            ),

            // The Books
            DragAndDropList(
              canDrag: false,
              header: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Books",
                  style: semiBoldSecondary.copyWith(fontSize: 18),
                ),
              ),
              children: booksTasks
                  .map((t) => DragAndDropItem(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 36, 0),
                        child: t,
                      )))
                  .toList(),
            ),

            // The Movies
            DragAndDropList(
              canDrag: false,
              header: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Movies",
                  style: semiBoldSecondary.copyWith(fontSize: 18),
                ),
              ),
              children: moviesTasks
                  .map((t) => DragAndDropItem(
                          child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 36, 0),
                        child: t,
                      )))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void onReorderLists(oldItemIndex, oldListIndex, newItemIndex, newListIndex) {
    // Update the task priority if needed
    if (lists[newListIndex][newItemIndex == lists[newListIndex].length
                ? newItemIndex - 1
                : newItemIndex]
            .priority !=
        lists[oldListIndex][oldItemIndex].priority) {
      lists[oldListIndex][oldItemIndex] = lists[oldListIndex][oldItemIndex]
          .copyWith(
              priority: lists[newListIndex][
                      newItemIndex == lists[newListIndex].length
                          ? newItemIndex - 1
                          : newItemIndex]
                  .priority);
    }

    lists[newListIndex]
        .insert(newItemIndex, lists[oldListIndex].removeAt(oldItemIndex));

    setState(() {});
  }

  void onReorderBooks(int start, int end) {
    setState(() {
      if (end > start) end--;

      // Update the task priority if needed
      if (booksTasks[end].priority != booksTasks[start].priority) {
        booksTasks[start] =
            booksTasks[start].copyWith(priority: booksTasks[end].priority);
      }

      booksTasks.insert(end, booksTasks.removeAt(start));
    });
  }

  void onReorderMovies(int start, int end) {
    setState(() {
      if (end > start) end--;

      // Update the task priority if needed
      if (moviesTasks[end].priority != moviesTasks[start].priority) {
        moviesTasks[start] =
            moviesTasks[start].copyWith(priority: moviesTasks[end].priority);
      }

      moviesTasks.insert(end, moviesTasks.removeAt(start));
    });
  }

  void onReorderUnscheduled(int start, int end) {
    setState(() {
      if (end > start) end--;

      // Update the task priority if needed
      if (unscheduledTasks[end].priority != unscheduledTasks[start].priority) {
        unscheduledTasks[start] = unscheduledTasks[start]
            .copyWith(priority: unscheduledTasks[end].priority);
      }

      unscheduledTasks.insert(end, unscheduledTasks.removeAt(start));
    });
  }
}
