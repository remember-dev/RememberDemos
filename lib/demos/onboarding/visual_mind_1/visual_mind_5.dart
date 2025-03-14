import 'package:flutter/material.dart';
import 'visual_mind_4.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/Button.dart';
import 'package:remember_demos/widgets/utils.dart';

class VisualMind5 extends StatefulWidget {
  final String name;
  const VisualMind5({super.key, required this.name});

  @override
  State<VisualMind5> createState() => _VisualMind5State();
}

class _VisualMind5State extends State<VisualMind5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
            child: Text(
              "How do you like to plan, ${widget.name}?",
              style: semiBoldPrimary.copyWith(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SelectableButton(
                      selected: false,
                      label: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "Lots of small achievable tasks",
                          style: mediumSecondary.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      selectedColor: taskColors[0].withAlpha(0xDD),
                      unselectedColor: taskColors[0].withAlpha(0xDD),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VisualMind4(name: widget.name),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SelectableButton(
                      selected: false,
                      label: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "A few large goals that I can strive for",
                          style: mediumSecondary.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      selectedColor: taskColors[1].withAlpha(0xDD),
                      unselectedColor: taskColors[1].withAlpha(0xDD),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VisualMind4(name: widget.name),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SelectableButton(
                      selected: false,
                      label: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "Whatever feels the best at the moment 🤷",
                          style: mediumSecondary.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      selectedColor: taskColors[2].withAlpha(0xDD),
                      unselectedColor: taskColors[2].withAlpha(0xDD),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VisualMind4(name: widget.name),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
