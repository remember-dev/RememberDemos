import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/widgets/utils.dart';
import 'visual_mind_3.dart';

class VisualMind2 extends StatefulWidget {
  const VisualMind2({super.key});

  @override
  State<VisualMind2> createState() => _VisualMind2State();
}

class _VisualMind2State extends State<VisualMind2> {
  final plannerType = [
    "I am a\ngrandmaster\nplanner",
    "I am an\nexpert\nplanner",
    "I am a\nadvanced\nplanner",
    "I am a\nnovice\nplanner",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
            child: Text(
              "Use these planning tools to take control of your life.",
              style: semiBoldPrimary.copyWith(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "5 minute process.",
            style: semiBoldSecondary,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 columns
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 4, // 4 items
                itemBuilder: (context, index) {
                  return GridTile(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => VisualMind3()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: taskColors[index + 1],
                        shadowColor: Colors.grey,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        plannerType[index],
                        style: regularPrimary.copyWith(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
