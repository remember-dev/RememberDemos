import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_3.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_2 extends StatefulWidget {
  const Onboarding_3_2({super.key});

  @override
  State<Onboarding_3_2> createState() => _Onboarding_3_2State();
}

class _Onboarding_3_2State extends State<Onboarding_3_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Text(
                "Not just another planner app",
              ),
              const SizedBox(height: 32),
              Text(
                "Explain about VALUES-BASED planning (Triangle action GIF)",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RememberBottomAppBar(
        leftText: "Back",
        rightText: "Next",
        rightEnabled: true,
        onPressedLeft: () {
          Navigator.pop(context);
        },
        onPressedRight: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Onboarding_3_3()),
          );
        },
      ),
    );
  }
}
