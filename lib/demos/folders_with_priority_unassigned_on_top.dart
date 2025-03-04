import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/task_row.dart';

class FoldersWithPriorityUnscheduledOnTop extends StatefulWidget {
  const FoldersWithPriorityUnscheduledOnTop({super.key});

  @override
  State<FoldersWithPriorityUnscheduledOnTop> createState() =>
      _FoldersWithPriorityUnscheduledOnTopState();
}

class _FoldersWithPriorityUnscheduledOnTopState
    extends State<FoldersWithPriorityUnscheduledOnTop> {
  List<List<TaskRow>> lists = [
    [
      TaskRow(title: "Charlotte's Web", color: colors[1], priority: 0),
      TaskRow(title: "Harry Potter", color: colors[4], priority: 1),
      TaskRow(title: "Atomic Habits", color: colors[2], priority: 2),
    ],
    [
      TaskRow(title: "Lego Batman", color: colors[0], priority: 0),
      TaskRow(title: "Apollo 13", color: colors[7], priority: 0),
      TaskRow(title: "Lord of the Rings", color: colors[6], priority: 1),
      TaskRow(title: "12 Angry Men", color: colors[3], priority: 1),
      TaskRow(title: "Indiana Jones", color: colors[8], priority: 2),
      TaskRow(title: "Jurrasic Park", color: colors[5], priority: 2),
    ],
    List.generate(
        10,
        (i) => randomTaskRow(ValueKey(i),
            title: "Unscheduled $i",
            color: colors[i % colors.length],
            priority: i ~/ 4 % 3))
      ..sort((t1, t2) => t1.priority - t2.priority),
  ];

  List<TaskRow> get booksTasks => lists[0];
  List<TaskRow> get moviesTasks => lists[1];
  List<TaskRow> get unscheduledTasks => lists[2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  style: MOS.copyWith(fontSize: 18),
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
                  style: MOS.copyWith(fontSize: 18),
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
                  style: MOS.copyWith(fontSize: 18),
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
