import 'package:flutter/material.dart';
import 'package:remember_demos/demos/planning_process_3/planning_3_common.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

class PlanningHome3 extends StatefulWidget {
  const PlanningHome3({super.key});

  @override
  State<PlanningHome3> createState() => _PlanningHome3State();
}

class _PlanningHome3State extends State<PlanningHome3> {
  List<PersonalValue> valuesWithTasks = Planning3DataStore.values;

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              whiteAreaWithText(
                "Nice! You’ve completed your first value thread. Would you like to finish one of the others?",
              ),
              scrollingCategories((_) {}),
              const SizedBox(height: 8),
              ...valuesWithTasks.map((v) => valueReport(v)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(999)),
        child: Icon(
          Icons.add_circle_outline,
          size: 32,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: GenericBottomAppBar(
        children: [
          ElevatedButton(
            onPressed: () {
              Planning3DataStore.planningStep = PlanningStep.Tasks;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(),
                ),
                (_) => false,
              );
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
