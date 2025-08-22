import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/demos/planning/planning_goals_2.dart';
import 'package:remember_demos/demos/task_details/task_details_1.dart';
import 'package:remember_demos/entities/goal.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';
import 'package:remember_demos/widgets/remember_planning_top_bar.dart';
import 'package:remember_demos/widgets/remember_title.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/utils.dart';

class PlanningTasks2 extends StatefulWidget {
  final List<Goal> goalsToShow;
  final List<PersonalValue> pendingValueCategories;

  const PlanningTasks2({
    super.key,
    required this.goalsToShow,
    required this.pendingValueCategories,
  });

  @override
  State<PlanningTasks2> createState() => _PlanningTasks2State();
}

class _PlanningTasks2State extends State<PlanningTasks2> {
  List<BasicTask> _tasks = [];
  bool _thereAreTasks = false;
  Future<List<String>>? suggestions;

  late Goal currentGoal = widget.goalsToShow.removeAt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RememberTitle(title: "Planning"),
      body: Column(
        children: [
          RememberPlanningTopBar(
            titles: [
              "Values",
              "Goals ",
              "Tasks",
            ],
            textSpans: [
              TextSpan(
                  text: "Create specific tasks that accomplish your goal to "),
              const TextSpan(text: '\n'),
              TextSpan(
                text: currentGoal.title,
                style: TextStyle(backgroundColor: currentGoal.color),
              )
            ],
            currentStep: 3,
          ),
          buildTaskView(),
          Text(
            'AI suggestions',
            style: boldSecondary.copyWith(fontSize: 18),
          ),
          Expanded(
            child: FutureBuilder(
              future: suggestions,
              builder: getAiSuggestions,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
            child: ListTile(
              leading: Image.asset('assets/directive-add.png'),
              title: Text(
                _thereAreTasks ? 'Add Another Task' : 'Add Task',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
              onTap: () async {
                bool? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TaskDetails1(
                      categoryId: currentGoal.valueId,
                      goalId: currentGoal.id,
                    ),
                  ),
                );
                if (result == true) {
                  loadGoals();
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: RememberBottomAppBar(
        leftText: "PREV",
        rightText: widget.goalsToShow.isNotEmpty
            ? "NEXT GOAL"
            : widget.pendingValueCategories.isNotEmpty
                ? "NEXT VALUE"
                : "IMPLEMENT",
        onPressedLeft: () {
          Navigator.pop(context);
        },
        onPressedRight: () {
          if (widget.goalsToShow.isNotEmpty) {
            // Go back to this screen with a different goal
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlanningTasks2(
                    goalsToShow: widget.goalsToShow,
                    pendingValueCategories: widget.pendingValueCategories,
                  ),
                ));
            return;
          }

          if (widget.pendingValueCategories.isNotEmpty) {
            // Go back to the goals screen with the pending values
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PlanningGoals2(
                  valuesToShow: widget.pendingValueCategories,
                ),
              ),
            );
            return;
          }

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
            (Route<dynamic> route) => false,
          );
        },
        rightEnabled: _thereAreTasks,
      ),
    );
  }

  void loadGoals() {
    // suggestions = aiApiService.getTaskIdeas(widget.goalsToShow[0].title);
    _tasks = List.generate(
        5, (_) => randomBasicTask(goalId: widget.goalsToShow.first.id));

    // basicTaskService
    //     .getTasksByGoalId(
    //         widget.goalsToShow[0].id, UserDataStore().userId, true)
    //     .where((element) =>
    //         !element.isDelegatedTask &&
    //         (!element.completed ||
    //             (element.completed &&
    //                 element.lastModified.difference(DateTime.now()).inDays ==
    //                     0)))
    //     .toList();

    if (_tasks.isNotEmpty) {
      setState(() {
        _thereAreTasks = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.goalsToShow.isNotEmpty) {
      loadGoals();
    }
  }

  Widget getAiSuggestions(context, AsyncSnapshot<List<String>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Column(children: [CircularProgressIndicator()]);
    } else if (snapshot.hasError) {
      return Text("Error: ${snapshot.error}");
    } else if (snapshot.data == null) {
      return SizedBox();
    } else {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          var suggestedTask = BasicTask(
            id: Guid.newGuid,
            taskTitle: snapshot.data![index].substring(
                0,
                snapshot.data![index].length > 100
                    ? 100
                    : snapshot.data![index].length),
            lastModified: DateTime.now(),
            userId: Guid.newGuid,
            completed: false,
            scheduledTime: null,
            archived: false,
            isDeleted: false,
            isGoalTask: true,
            isDelegatedTask: false,
            color: currentGoal.color,
            priority: 1,
            orderGroup: 0,
            dateCompleted: null,
            goalId: widget.goalsToShow[0].id,
          );
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: TaskRow.fromBasicTask(suggestedTask),
          );
        },
      );
    }
  }

  // void addSuggestedTask(BasicTaskExtended suggestedTask) async {
  //   basicTaskService.insert(suggestedTask);
  //   await basicTaskApiService.createBasicTask(suggestedTask);
  //   loadGoals();
  // }

  Widget buildTaskView() {
    if (_tasks.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ..._tasks
              .where((element) =>
                  !element.isDelegatedTask &&
                  (!element.completed ||
                      (element.completed &&
                          element.lastModified
                                  .difference(DateTime.now())
                                  .inDays ==
                              0)))
              .map((task) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              child: TaskRow.fromBasicTask(task),
            );
          }),
        ],
      );
    }

    return const Text('');
  }
}
