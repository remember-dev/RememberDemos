import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_6.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_5 extends StatefulWidget {
  const Onboarding_3_5({super.key});

  @override
  State<Onboarding_3_5> createState() => _Onboarding_3_5State();
}

class _Onboarding_3_5State extends State<Onboarding_3_5> {
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
                "3. How do you learn best? (Visual, audio, reading)",
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
            MaterialPageRoute(builder: (_) => Onboarding_3_6()),
          );
        },
      ),
    );
  }
}
