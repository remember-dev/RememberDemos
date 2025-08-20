import 'package:flutter/material.dart';
import 'package:remember_demos/demos/planning_process_3/planning_3_common.dart';

class PlanningValues3 extends StatefulWidget {
  const PlanningValues3({super.key});

  @override
  State<PlanningValues3> createState() => _PlanningValues3State();
}

class _PlanningValues3State extends State<PlanningValues3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          planningTitleThing(),
          whiteAreaWithText(),
          scrollingCategories(),
          valueGoalButtons(),
          valueChip(),
          goalChip(),
          bottomButtons(),
        ],
      ),
    );
  }
}
