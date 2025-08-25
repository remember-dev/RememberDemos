import 'package:flutter/material.dart';
import 'package:remember_demos/demos/planning_process_3/planning_3_common.dart';
import 'package:remember_demos/demos/planning_process_3/planning_goals_3.dart';
import 'package:remember_demos/entities/category.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/entities/services.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/generic_bottom_app_bar.dart';

class PlanningValues3 extends StatefulWidget {
  const PlanningValues3({super.key});

  @override
  State<PlanningValues3> createState() => _PlanningValues3State();
}

class _PlanningValues3State extends State<PlanningValues3> {
  Category selectedCategory = categories.first;
  PersonalValue? selectedValue;

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
            whiteAreaWithText(
              "Think about what matters to you - then tap a category and choose one value to begin",
            ),
            scrollingCategories((category) {
              setState(() {
                selectedCategory = category;
              });
            }),
            AnimatedSwitcher(
              duration: Durations.medium2,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: ScaleTransition(scale: animation, child: child),
              ),
              child: valueButtons(
                selectedCategory,
                selectedValue,
                (value) {
                  setState(() {
                    if (selectedValue == value) {
                      selectedValue = null;
                    } else {
                      selectedValue = value;
                    }
                  });
                },
                ValueKey(selectedCategory),
              ),
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
            onPressed: selectedValue == null
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PlanningGoals3(
                          category: selectedCategory,
                          pValue: selectedValue!,
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
