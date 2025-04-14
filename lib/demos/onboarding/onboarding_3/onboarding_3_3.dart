import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_4.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_3 extends StatefulWidget {
  const Onboarding_3_3({super.key});

  @override
  State<Onboarding_3_3> createState() => _Onboarding_3_3State();
}

class _Onboarding_3_3State extends State<Onboarding_3_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Text(
                "5 question interview",
              ),
              const SizedBox(height: 32),
              Text(
                "1. What is your name? (Display name)",
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
            MaterialPageRoute(builder: (_) => Onboarding_3_4()),
          );
        },
      ),
    );
  }
}
