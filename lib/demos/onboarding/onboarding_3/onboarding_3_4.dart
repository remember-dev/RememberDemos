import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_5.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_4 extends StatefulWidget {
  const Onboarding_3_4({super.key});

  @override
  State<Onboarding_3_4> createState() => _Onboarding_3_4State();
}

class _Onboarding_3_4State extends State<Onboarding_3_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Text(
                "",
              ),
              const SizedBox(height: 32),
              Text(
                "2. What is most important to you? (List 8 value categories, select 3-5)",
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
            MaterialPageRoute(builder: (_) => Onboarding_3_5()),
          );
        },
      ),
    );
  }
}
