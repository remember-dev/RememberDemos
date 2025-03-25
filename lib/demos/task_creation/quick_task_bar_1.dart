import 'package:flutter/material.dart';
import 'package:remember_demos/widgets/utils.dart';

class QuickTaskBar1 extends StatefulWidget {
  final VoidCallback onClose;
  final VoidCallback onSubmit;

  const QuickTaskBar1({
    super.key,
    required this.onClose,
    required this.onSubmit,
  });

  @override
  State<StatefulWidget> createState() => _QuickTaskBar1State();
}

class _QuickTaskBar1State extends State<QuickTaskBar1> {
  List<bool> selected = [false, false, false];
  bool prioritySelected = false;
  TextEditingController textController = TextEditingController();

  void onSelectChoice(bool value, int index) {
    selected = List.generate(selected.length, (_) => false);
    selected[index] = value;
    setState(() {});
  }

  bool validate() {
    if (textController.text.trim().isNotEmpty) return true;
    return false;
  }

  void onClose() {
    widget.onClose();
  }

  void onSubmitQuickTask() {
    hideKeyboard();
    validate();

    textController.clear();
    selected = [false, false, false, false];
    widget.onSubmit();
  }

  /// Open the taskDetails screen with a BasicTask with TaskTitle
  void onDetails() {
    validate();
    textController.clear();
    selected = [false, false, false, false];
    widget.onSubmit();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 226, 234, 238),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceChip(
                          label: const Text("Today"),
                          selected: selected[0],
                          onSelected: (value) => onSelectChoice(value, 0),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text("Tomorrow"),
                          selected: selected[1],
                          onSelected: (value) => onSelectChoice(value, 1),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text("Someday"),
                          selected: selected[2],
                          onSelected: (value) => onSelectChoice(value, 2),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text("Priority"),
                          selected: prioritySelected,
                          onSelected: (value) {
                            setState(() {
                              prioritySelected = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text("Details"),
                          selected: false,
                          onSelected: textController.text.trim().isEmpty
                              ? null
                              : (_) => onDetails(),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            TextField(
              controller: textController,
              maxLength: 100,
              // Update state on change to enable/disable the "details button"
              onChanged: (_) => setState(() {}),
              onSubmitted: (value) {
                print(value);
              },
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
              decoration: InputDecoration(
                counterText: "",
                hintText: "Enter task title",
                suffix: IconButton(
                  onPressed: () {
                    onSubmitQuickTask();
                  },
                  icon: const Icon(Icons.done),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
