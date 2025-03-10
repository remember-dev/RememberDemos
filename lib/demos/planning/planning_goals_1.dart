import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/demos/planning/planning_tasks_1.dart';
import 'package:remember_demos/entities/Goal.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/entities/services.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/Button.dart';
import 'package:remember_demos/widgets/dry_intrinsic_width.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';
import 'package:remember_demos/widgets/remember_planning_top_bar.dart';
import 'package:remember_demos/widgets/remember_title.dart';
import 'package:remember_demos/widgets/utils.dart';

class PlanningGoals1 extends StatefulWidget {
  final List<PersonalValue> valuesToShow;

  const PlanningGoals1({super.key, required this.valuesToShow});

  @override
  State<PlanningGoals1> createState() => _PlanningGoals1State();
}

class _PlanningGoals1State extends State<PlanningGoals1> {
  final List<Goal> selectedGoals = [];
  Map<String, bool> selectedGoal = {};
  Map<String, bool> editingGoal = {};
  Map<String, TextEditingController> textFields = {};

  late Color valueColor = widget.valuesToShow.first.color;

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
              TextSpan(text: "Identify goals to fulfill your "),
              TextSpan(
                text: widget.valuesToShow.first.title,
                style: TextStyle(backgroundColor: valueColor),
              ),
              TextSpan(text: " value"),
            ],
            currentStep: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: buildGoalsView(
                    getGoalsByPersonalValue(widget.valuesToShow.first)
                        .toList()),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RememberBottomAppBar(
        key: Key('RememberBottomAppBar${selectedGoals.length}'),
        leftText: "CANCEL",
        rightText: "NEXT",
        onPressedLeft: () {
          Navigator.pop(context);
        },
        onPressedRight: () {
          if (selectedGoals.isEmpty) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlanningTasks1(
                goalsToShow: selectedGoals,
                pendingValueCategory: widget.valuesToShow.sublist(1),
                valueColor: valueColor,
                currentValue: widget.valuesToShow.first,
              ),
            ),
          );
        },
        rightEnabled: selectedGoals.isNotEmpty,
      ),
    );
  }

  Widget buildGoalsView(List<Goal> goals) {
    textFields[''] = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(), // This makes sure it takes up max space horizontally
        ...goals.map((goal) {
          textFields[goal.id.toString()] = TextEditingController();
          return SelectableButton(
            selected: selectedGoal[goal.id.toString()] ?? false,
            selectedColor: valueColor,
            onPressed: () {
              onChanged(goal);
              setState(() {});
            },
            icon: goal.customGoal && !isEditing(goal)
                ? InkWell(
                    onTap: () {
                      setState(() => editingGoal[goal.id.toString()] = true);
                    },
                    child: const Icon(Icons.edit_outlined),
                  )
                : null,
            label: isEditing(goal) ? getEditContainer(goal) : Text(goal.title),
          );
        }),
        getEditContainer(null),
      ],
    );
  }

  // TODO: This code is duplicated across PlanningValues and PlanningGoals
  Widget getEditContainer(Goal? goal) {
    if (goal != null) {
      textFields[goal.id.toString()]?.text = goal.title;
    }
    return Container(
      padding: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 1),
      child: DryIntrinsicWidth(
        child: TextField(
          autofocus: goal != null,
          controller:
              goal == null ? textFields[''] : textFields[goal.id.toString()],
          maxLength: 100,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.sentences,
          minLines: 1,
          maxLines: 1,
          autocorrect: true,
          decoration: InputDecoration(
            counterText: "",
            isDense: true,
            prefixIcon: const Icon(Icons.edit_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "Custom",
            hintStyle: mediumPrimary.copyWith(color: Colors.grey, fontSize: 16),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
          onTapOutside: (_) async {
            if (goal == null) {
              saveGoal(textFields['']!.text);
            } else {
              Goal newGoal = Goal(
                id: goal.id,
                lastModified: DateTime.now(),
                valueId: goal.valueId,
                title: textFields[goal.id.toString()]?.text ?? goal.title,
                description: goal.description,
                color: goal.color,
                customGoal: goal.customGoal,
                userId: goal.userId,
                completed: goal.completed,
              );
              updateGoal(newGoal);
            }
            setState(() {
              if (goal == null) {
                editingGoal[''] = false;
              } else {
                editingGoal[goal.id.toString()] = false;
              }
            });
          },
          onSubmitted: (value) async {
            if (goal == null) {
              saveGoal(value);
            } else {
              Goal newGoal = Goal(
                id: goal.id,
                lastModified: DateTime.now(),
                valueId: goal.valueId,
                title: textFields[goal.id.toString()]?.text ?? goal.title,
                description: goal.description,
                color: goal.color,
                customGoal: goal.customGoal,
                userId: goal.userId,
                completed: goal.completed,
              );
              updateGoal(newGoal);
            }
            setState(() {
              if (goal == null) {
                editingGoal[''] = false;
              } else {
                editingGoal[goal.id.toString()] = false;
              }
            });
          },
        ),
      ),
    );
  }

  void saveGoal(String title) {
    title = title.trim();

    if (title.isNotEmpty) {
      // Check that no duplicates goal names for the personal value are allowed.
      for (Goal goal in getGoalsByPersonalValue(widget.valuesToShow.first)) {
        if (goal.title.toLowerCase() == title.toLowerCase()) {
          textFields['']?.clear();
          return;
        }
      }

      Goal newGoal = Goal(
        id: Guid.newGuid,
        lastModified: DateTime.now(),
        valueId: widget.valuesToShow.first.id,
        title: title,
        description: "",
        color: widget.valuesToShow.first.color,
        customGoal: true,
        userId: Guid.newGuid,
        completed: false,
      );
      goals.add(newGoal);

      setState(() {
        hideKeyboard();
        textFields['']?.clear();
        onChanged(newGoal);
      });
    }
    hideKeyboard();
  }

  void updateGoal(Goal goal) {
    // // Trim value to remove unnecessary whitespace.
    // String value = goal.title.toLowerCase().trim();

    // if (goal.title.isNotEmpty) {
    //   // Check that no duplicates goal names for the personal value are allowed.
    //   for (Goal g in getGoalsByPersonalValue(widget.valuesToShow.first)) {
    //     if (g.title.toLowerCase() == value) {
    //       textFields[goal.id.toString()]?.clear();
    //       return;
    //     }
    //   }

    //   goals.update(goal);
    //   setState(() {
    //     textFields[goal.id.toString()]?.clear();
    //     onChanged(goal);
    //   });
    // }
  }

  void onChanged(Goal goal) {
    bool initialValue = selectedGoal[goal.id.toString()] ?? false;
    selectedGoal.clear();
    selectedGoal[goal.id.toString()] = !initialValue;
    selectedGoals.clear();
    // Only add the selected goal if the goal is selected
    if (!initialValue) selectedGoals.add(goal);
  }

  bool isEditing(Goal e) {
    return editingGoal[e.id.toString()] == true;
  }
}
