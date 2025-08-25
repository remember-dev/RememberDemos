import 'package:flutter/material.dart';
import 'package:remember_demos/demos/planning_process_3/planning_3_common.dart';
import 'package:remember_demos/demos/planning_process_3/planning_tasks_3.dart';
import 'package:remember_demos/entities/category.dart';
import 'package:remember_demos/entities/goal.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

class PlanningGoals3 extends StatefulWidget {
  final Category category;
  final PersonalValue pValue;

  const PlanningGoals3({
    super.key,
    required this.pValue,
    required this.category,
  });

  @override
  State<PlanningGoals3> createState() => _PlanningGoals3State();
}

class _PlanningGoals3State extends State<PlanningGoals3> {
  Goal? selectedGoal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Planning",
          style: regularPrimary.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RememberPlanning3TopBar(step: PlanningStep.Goals),
            whiteAreaWithText(
              "Now that you’ve chosen to work on ${widget.pValue.title}, select a goal that will support that value.",
            ),
            const SizedBox(height: 8),
            valueChip(widget.pValue, widget.category),
            const SizedBox(height: 8),
            goalButtons(
              widget.pValue,
              selectedGoal,
              (goal) {
                setState(() {
                  selectedGoal = goal;
                });
              },
              ValueKey(selectedGoal),
            ),
            const Spacer(),
            planningDivider(),
            const SizedBox(height: 8),
            bottomButtons(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: GenericBottomAppBar(
        children: [
          ElevatedButton(
            onPressed: selectedGoal == null
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlanningTasks3(
                          category: widget.category,
                          pValue: widget.pValue,
                          goal: selectedGoal!,
                        ),
                      ),
                    );
                  },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
