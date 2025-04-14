import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_9.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_8 extends StatefulWidget {
  const Onboarding_3_8({super.key});

  @override
  State<Onboarding_3_8> createState() => _Onboarding_3_8State();
}

class _Onboarding_3_8State extends State<Onboarding_3_8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Text(
                "Planning Process",
              ),
              const SizedBox(height: 32),
              Text(
                "WHICH one do you want to start with? (40 Value prompts with AI button added)",
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
            MaterialPageRoute(builder: (_) => Onboarding_3_9()),
          );
        },
      ),
    );
  }
}
