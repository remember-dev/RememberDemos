//
// Widgets to use for the whole PlanningProcess3 so that when I put it into the app it's already good to go.
//

import 'package:flutter/material.dart';
import 'package:remember_demos/entities/category.dart';
import 'package:remember_demos/entities/goal.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/entities/services.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/button.dart';

Widget planningTitleThing() {
  return Center(
    child: Text(
      "Planning",
      style: regularPrimary.copyWith(fontSize: 20),
    ),
  );
}

Widget whiteAreaWithText() {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Text(
        "Think about what matters to you - then tap a category and choose one value to begin",
        style: regularPrimary.copyWith(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget categoryButton(category) {
  return Card(
    color: category.color,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      child: Text(
        category.title.toUpperCase(),
        style: boldPrimary.copyWith(fontSize: 16),
      ),
    ),
  );
}

Widget scrollingCategories() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        categoryButton(categories[0]),
        categoryButton(categories[1]),
        categoryButton(categories[2]),
        categoryButton(categories[3]),
        categoryButton(categories[4]),
        categoryButton(categories[5]),
        categoryButton(categories[6]),
        categoryButton(categories[7]),
      ],
    ),
  );
}

Widget valueButtons(Category category) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: getPersonalValuesByCategory(category)
        .map((p) => valueGoalButton(ValueOrGoal(p)))
        .toList(),
  );
}

Widget goalButtons(PersonalValue value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: getGoalsByPersonalValue(value)
        .map((g) => valueGoalButton(ValueOrGoal(g)))
        .toList(),
  );
}

Widget valueGoalButton(ValueOrGoal valueOrGoal) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: ValueGoalProcess3Button(
      label: Text(
        valueOrGoal.title.toUpperCase(),
      ),
      selectedColor: Colors.white,
    ),
  );
}

Widget valueChip() {
  return Placeholder();
}

Widget goalChip() {
  return Placeholder();
}

Widget bottomButtons() {
  return Placeholder();
}
