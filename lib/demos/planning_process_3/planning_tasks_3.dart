import 'package:flutter/material.dart';
import 'package:remember_demos/demos/planning_process_3/planning_3_common.dart';
import 'package:remember_demos/entities/category.dart';
import 'package:remember_demos/entities/goal.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';
import 'package:remember_demos/widgets/task_row.dart';

class PlanningTasks3 extends StatefulWidget {
  final Category category;
  final PersonalValue pValue;
  final Goal goal;

  const PlanningTasks3({
    super.key,
    required this.pValue,
    required this.category,
    required this.goal,
  });

  @override
  State<PlanningTasks3> createState() => _PlanningTasks3State();
}

class _PlanningTasks3State extends State<PlanningTasks3> {
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
            RememberPlanning3TopBar(step: PlanningStep.Tasks),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                valueChip(widget.pValue, widget.category),
                goalChip(widget.goal),
              ],
            ),
            const SizedBox(height: 8),
            whiteAreaWithText(
              "Finally, create some tasks that will help you progress in you goal to ${widget.goal.title}.",
            ),
            Expanded(
              child: Column(
                children: List.generate(
                  5,
                  (i) => randomAiSuggestion(
                    color: widget.goal.color,
                    completed: false,
                    priority: i,
                  ),
                ),
              ),
            ),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => PlanningTasks3(
                    //       goal: selectedGoal!,
                    //     ),
                    //   ),
                    // );
                  },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
