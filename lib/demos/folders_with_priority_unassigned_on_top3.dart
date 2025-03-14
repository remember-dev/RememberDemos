import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/utils.dart';

class FoldersWithPriorityUnscheduledOnTop3 extends StatefulWidget {
  const FoldersWithPriorityUnscheduledOnTop3({super.key});

  @override
  State<FoldersWithPriorityUnscheduledOnTop3> createState() =>
      _FoldersWithPriorityUnscheduledOnTop3State();
}

class _FoldersWithPriorityUnscheduledOnTop3State
    extends State<FoldersWithPriorityUnscheduledOnTop3> {
  List<List<TaskRow>> lists = [
    List.generate(
        75,
        (i) => randomTaskRow(ValueKey(i),
            title: "Task $i",
            color: taskColors[i % taskColors.length],
            priority: i ~/ (75 / 3))),
    [
      TaskRow(title: "Charlotte's Web", color: taskColors[1], priority: 0),
      TaskRow(title: "Harry Potter", color: taskColors[4], priority: 0),
      TaskRow(title: "Atomic Habits", color: taskColors[2], priority: 1),
      TaskRow(
          title: "To Kill a Mockingbird", color: randomTaskColor, priority: 1),
      TaskRow(title: "1984", color: randomTaskColor, priority: 1),
      TaskRow(title: "Ender's Game", color: randomTaskColor, priority: 1),
      TaskRow(title: "The Great Gatsby", color: randomTaskColor, priority: 1),
      TaskRow(title: "Moby-Dick", color: randomTaskColor, priority: 2),
      TaskRow(
          title: "The Lord of the Rings", color: randomTaskColor, priority: 2),
      TaskRow(
          title: "Pride and Prejudice", color: randomTaskColor, priority: 2),
      TaskRow(
          title: "The Catcher in the Rye", color: randomTaskColor, priority: 2),
      TaskRow(title: "The Hobbit", color: randomTaskColor, priority: 2),
      TaskRow(
          title: "Chronicles of Narnia", color: randomTaskColor, priority: 2),
    ],
    [
      TaskRow(title: "Lego Batman", color: taskColors[0], priority: 0),
      TaskRow(title: "Apollo 13", color: taskColors[7], priority: 0),
      TaskRow(title: "Lord of the Rings", color: taskColors[6], priority: 0),
      TaskRow(title: "12 Angry Men", color: taskColors[3], priority: 1),
      TaskRow(title: "Indiana Jones", color: taskColors[8], priority: 1),
      TaskRow(title: "Jurrasic Park", color: randomTaskColor, priority: 1),
      TaskRow(title: "The Godfather", color: randomTaskColor, priority: 1),
      TaskRow(title: "Titanic", color: randomTaskColor, priority: 1),
      TaskRow(title: "The Dark Knight", color: randomTaskColor, priority: 1),
      TaskRow(title: "Forrest Gump", color: randomTaskColor, priority: 1),
      TaskRow(title: "Jurassic Park", color: randomTaskColor, priority: 2),
      TaskRow(title: "The Matrix", color: randomTaskColor, priority: 2),
      TaskRow(title: "Star Wars", color: randomTaskColor, priority: 2),
      TaskRow(title: "The Avengers", color: randomTaskColor, priority: 2),
      TaskRow(title: "Inception", color: randomTaskColor, priority: 2),
      TaskRow(title: "The Lion King", color: randomTaskColor, priority: 2),
      TaskRow(title: "The Chosen", color: randomTaskColor, priority: 2),
      TaskRow(title: "Spider-Man", color: randomTaskColor, priority: 2),
      TaskRow(title: "Avatar", color: randomTaskColor, priority: 2),
      TaskRow(title: "Back to the Future", color: randomTaskColor, priority: 2),
      TaskRow(title: "Gladiator", color: randomTaskColor, priority: 2),
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
                  "No Folder",
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
