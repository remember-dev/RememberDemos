import 'package:flutter/material.dart';
import 'package:remember_demos/demos/planning_process_3/planning_3_common.dart';
import 'package:remember_demos/entities/services.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

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
          valueButtons(categories.first),
          bottomButtons(),
        ],
      ),
      bottomNavigationBar: GenericBottomAppBar(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
