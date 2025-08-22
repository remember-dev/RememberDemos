//
// Widgets to use for the whole PlanningProcess3 so that when I put it into the app it's already good to go.
//

import 'package:flutter/material.dart';
import 'package:remember_demos/entities/category.dart';
import 'package:remember_demos/entities/goal.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/entities/services.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/button.dart';

Widget planningTitleThing() {
  return Center(
    child: Text(
      "Planning",
      style: regularPrimary.copyWith(fontSize: 20),
    ),
  );
}

Widget whiteAreaWithText(String text) {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Text(
        text,
        style: regularPrimary.copyWith(fontSize: 16),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget categoryButton(category, Function(Category) onTap) {
  return Card(
    color: category.color,
    child: InkWell(
      onTap: () => onTap(category),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
        child: Text(
          category.title.toUpperCase(),
          style: boldPrimary.copyWith(fontSize: 16),
        ),
      ),
    ),
  );
}

Widget scrollingCategories(Function(Category) onTap) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        categoryButton(categories[0], onTap),
        categoryButton(categories[1], onTap),
        categoryButton(categories[2], onTap),
        categoryButton(categories[3], onTap),
        categoryButton(categories[4], onTap),
        categoryButton(categories[5], onTap),
        categoryButton(categories[6], onTap),
        categoryButton(categories[7], onTap),
      ],
    ),
  );
}

Widget valueButtons(Category category, Function(PersonalValue) onTap,
    [Key? key]) {
  return Column(
    key: key,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(),
      ...getPersonalValuesByCategory(category)
          .map((p) => valueButton(p, onTap)),
    ],
  );
}

Widget goalButtons(PersonalValue value, Function(Goal) onTap, [Key? key]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: getGoalsByPersonalValue(value)
        .map((g) => goalButton(g, onTap))
        .toList(),
  );
}

Widget valueButton(PersonalValue value, Function(PersonalValue) onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: ValueGoalProcess3Button(
      label: Text(
        value.title.toUpperCase(),
      ),
      selectedColor: Colors.white,
      onPressed: () => onTap(value),
    ),
  );
}

Widget goalButton(Goal goal, Function(Goal) onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: ValueGoalProcess3Button(
      label: Text(
        goal.title,
      ),
      selectedColor: Colors.white,
      onPressed: () => onTap(goal),
    ),
  );
}

Widget valueChip(PersonalValue value, Category category) {
  return Chip(
    color: WidgetStatePropertyAll(value.color),
    side: BorderSide(color: Colors.transparent),
    padding: EdgeInsets.all(0),
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Value | ",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        Text(
          "${value.title} (${category.title})",
          style: TextStyle(
            fontSize: 12,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget goalChip(Goal goal) {
  return Chip(
    color: WidgetStatePropertyAll(goal.color),
    side: BorderSide(color: Colors.transparent),
    padding: EdgeInsets.all(0),
    label: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Goal | ",
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        Text(
          goal.title,
          style: TextStyle(
            fontSize: 12,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget planningDivider() {
  return Divider(
    thickness: 0.5,
    color: Colors.grey,
  );
}

Widget bottomButtons() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(),
      TextButton.icon(
        icon: Icon(Icons.add),
        onPressed: () {},
        label: Text("ADD YOUR OWN"),
        style: RememberButtonStyles.primary,
      ),
      const SizedBox(height: 8),
      TextButton.icon(
        // icon: Icon(Icons.add),
        onPressed: () {},
        label: Text("✨ GET AI SUGGESTIONS"),
        style: RememberButtonStyles.primary,
      ),
    ],
  );
}
