import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
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

class PlanningTasks1 extends StatefulWidget {
  final List<Goal> goalsToShow;
  final List<PersonalValue> pendingValueCategory;
  final Color valueColor;
  final PersonalValue currentValue;

  const PlanningTasks1({
    super.key,
    required this.goalsToShow,
    required this.pendingValueCategory,
    required this.valueColor,
    required this.currentValue,
  });

  @override
  State<PlanningTasks1> createState() => _PlanningTasks1State();
}

class _PlanningTasks1State extends State<PlanningTasks1> {
  List<BasicTask> _tasks = [];
  bool _thereAreTasks = false;
  Future<List<String>>? suggestions;

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
                text: widget.goalsToShow[0].title,
                style: TextStyle(backgroundColor: widget.valueColor),
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
                      categoryId: widget.currentValue.categoryId,
                      goalId: widget.goalsToShow[0].id,
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
        rightText: widget.goalsToShow.isNotEmpty &&
                widget.pendingValueCategory.isNotEmpty
            ? 'NEXT GOAL'
            : 'IMPLEMENT',
        onPressedLeft: () {
          Navigator.pop(context);
        },
        onPressedRight: () {
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
            color: widget.valueColor,
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
