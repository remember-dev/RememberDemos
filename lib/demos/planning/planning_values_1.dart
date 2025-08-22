import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:remember_demos/demos/planning/planning_goals_1.dart';
import 'package:remember_demos/entities/category.dart';
import 'package:remember_demos/entities/personal_value.dart';
import 'package:remember_demos/entities/services.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/button.dart';
import 'package:remember_demos/widgets/dry_intrinsic_width.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';
import 'package:remember_demos/widgets/remember_planning_top_bar.dart';
import 'package:remember_demos/widgets/remember_title.dart';
import 'package:remember_demos/widgets/utils.dart';

class PlanningValues1 extends StatefulWidget {
  const PlanningValues1({super.key});

  @override
  State<StatefulWidget> createState() => _Planning();
}

class _Planning extends State<PlanningValues1> {
  Map<String, bool> editingCustomValue = {};
  List<PersonalValue> selectedValues = [];
  Map<String, bool> selected = {};
  Map<String, TextEditingController> textFields = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RememberTitle(
        title: "Planning",
      ),
      body: Column(children: [
        RememberPlanningTopBar(
          titles: [
            "Values",
            "Goals ",
            "Tasks",
          ],
          textSpans: [
            TextSpan(text: "Scroll to pick one of your highest priority values")
          ],
          currentStep: 1,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: buildValuesView(categories),
            ),
          ),
        )
      ]),
      bottomNavigationBar: RememberBottomAppBar(
        leftText: "CANCEL",
        rightText: "NEXT",
        onPressedLeft: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
          );
        },
        onPressedRight: () {
          if (selectedValues.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PlanningGoals1(valuesToShow: selectedValues),
              ),
            );
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => HomePage(),
              ),
              (Route<dynamic> route) => false,
            );
          }
        },
      ),
    );
  }

  Widget buildValuesView(List<Category> categories) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((category) {
        textFields[category.id.toString()] = TextEditingController();
        return IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                // The sideways categories "Health", "Relations", and on...
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: SelectableButton(
                        selected: true,
                        selectedColor: category.color,
                        label: Text(
                          category.title.toUpperCase(),
                          style: boldPrimary.copyWith(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 8),

                // The PersonalValues: Emotional, Mental, and so on...
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    children: [
                      ...getPersonalValuesByCategory(category).map(
                        (value) {
                          textFields[value.id.toString()] =
                              TextEditingController();
                          return SelectableButton(
                            selected: selected[value.id.toString()] == true,
                            selectedColor: category.color,
                            onPressed: () {
                              onChanged(value);
                              setState(() {});
                            },
                            icon: value.customValue && !isEditing(value)
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        editingCustomValue[
                                            value.id.toString()] = true;
                                      });
                                    },
                                    child: const Icon(Icons.edit_outlined),
                                  )
                                : null,
                            label: isEditing(value)
                                ? getEditContainer(category, value)
                                : Text(value.title.toUpperCase()),
                          );
                        },
                      ),
                      getEditContainer(category, null),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // TODO: This code is duplicated across PlanningValues and PlanningGoals
  Widget getEditContainer(Category item, PersonalValue? edit) {
    if (edit != null) {
      textFields[edit.id.toString()]?.text = edit.title.toUpperCase();
    }
    return SizedBox(
      height: 42,
      child: DryIntrinsicWidth(
        child: TextField(
          autofocus: edit != null,
          controller: edit == null
              ? textFields[item.id.toString()]
              : textFields[edit.id.toString()],
          maxLength: 100,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.sentences,
          minLines: 1,
          maxLines: 1,
          autocorrect: true,
          style: regularPrimary,
          decoration: InputDecoration(
            // TODO: Design a way to show x/100 characters to the user?
            counterText: "",
            isDense: true,
            // important line
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            prefixIcon: const Icon(Icons.edit_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "CUSTOM",
            hintStyle: mediumPrimary.copyWith(
                fontSize: 17, color: Colors.grey.shade500),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
          onTapOutside: (event) {
            hideKeyboard();
            if (edit == null) {
              saveValue(textFields[item.id.toString()]?.text ?? '', item);
            } else {
              PersonalValue newValue = PersonalValue(
                id: edit.id,
                lastModified: DateTime.now(),
                title: textFields[edit.id.toString()]?.text ?? edit.title,
                description: edit.description,
                color: edit.color,
                customValue: edit.customValue,
                categoryId: edit.categoryId,
              );
              updateValue(newValue, item);
            }
            setState(() {
              if (edit == null) {
                editingCustomValue[item.id.toString()] = false;
              } else {
                editingCustomValue[edit.id.toString()] = false;
              }
            });
          },
          onSubmitted: (value) {
            hideKeyboard();
            if (edit == null) {
              saveValue(value, item);
              editingCustomValue[item.id.toString()] = false;
            } else {
              PersonalValue newValue = PersonalValue(
                id: edit.id,
                lastModified: DateTime.now(),
                title: textFields[edit.id.toString()]?.text ?? edit.title,
                description: edit.description,
                color: edit.color,
                customValue: edit.customValue,
                categoryId: edit.categoryId,
              );
              updateValue(newValue, item);
              editingCustomValue[edit.id.toString()] = false;
            }
          },
        ),
      ),
    );
  }

  void updateValue(PersonalValue personalValue, Category item) {
    if (personalValue.title.isNotEmpty) {
      // Check that no duplicates are allowed.
      for (var personalValueCreated in personalValues) {
        if (personalValueCreated.title.toLowerCase().trim() ==
            personalValue.title) {
          setState(() {
            textFields[personalValue.id.toString()]?.clear();
          });
          return;
        }
      }

      setState(() {
        // Put the new PersonalValue back into the personalValueService map.
        // personalValueService.update(personalValue);
        selected[personalValue.id.toString()] = true;
        onChanged(personalValue);

        textFields[personalValue.id.toString()]?.clear();
      });
    }
  }

  void saveValue(String title, Category item) {
    // Lowercase the value name to standardize names. (they appear in all caps)
    // Trim to not allow whitespace names.
    title = title.toLowerCase().trim();

    if (title.isNotEmpty) {
      // Check that no duplicates are allowed.
      if (personalValues.any((p) => p.title.toLowerCase().trim() == title)) {
        setState(() {
          textFields[item.id.toString()]?.clear();
        });
        return;
      }

      // Create the new custom PersonalValue
      PersonalValue personalValue = PersonalValue(
        id: Guid.newGuid,
        lastModified: DateTime.now(),
        title: title,
        description: '',
        color: item.color,
        customValue: true,
        categoryId: item.id,
        userId: Guid.newGuid,
      );

      personalValues.add(personalValue);

      setState(() {
        onChanged(personalValue);
        textFields[personalValue.id.toString()]?.clear();
      });
    }
  }

  void onChanged(PersonalValue value) {
    bool initialValue = selected[value.id.toString()] ?? false;
    selected.clear();
    selected[value.id.toString()] = !initialValue;
    selectedValues.clear();
    // Only add the selected value if the value is selected
    if (!initialValue) selectedValues.add(value);
  }

  bool isEditing(PersonalValue value) {
    return editingCustomValue[value.id.toString()] == true;
  }
}
