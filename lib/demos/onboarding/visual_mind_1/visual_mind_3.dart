import 'package:flutter/material.dart';
import 'visual_mind_5.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/utils.dart';

class VisualMind3 extends StatefulWidget {
  const VisualMind3({super.key});

  @override
  State<VisualMind3> createState() => _VisualMind3State();
}

class _VisualMind3State extends State<VisualMind3> {
  final firstNameController = TextEditingController();
  bool get missingFirstName => firstNameController.text.trim().isEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
            child: Text(
              "What is your name?",
              style: semiBoldPrimary.copyWith(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: inputField(
              hintText: "First name",
              textController: firstNameController,
              hasError: false,
              characterLimit: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: missingFirstName ? secondaryStyle : primaryStyle,
                  onPressed: missingFirstName
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VisualMind5(
                                      name: firstNameController.text.trim(),
                                    )),
                          );
                        },
                  child: Text("Next"),
                ),
              ],
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  Widget inputField({
    required String hintText,
    required TextEditingController textController,
    required bool hasError,
    int? characterLimit,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasError ? Colors.red : Colors.white,
          width: 3,
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.name,
        textCapitalization: TextCapitalization.words,
        autofocus: true,
        controller: textController,
        maxLength: characterLimit,
        maxLines: 1,
        style: mediumPrimary,
        onTapOutside: (_) => hideKeyboard(),
        onSubmitted: (_) => hideKeyboard(),
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey.shade800),
          hintText: hintText,
          fillColor: Colors.white,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
