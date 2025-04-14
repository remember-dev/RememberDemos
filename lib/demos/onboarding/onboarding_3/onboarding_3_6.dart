import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_7.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_6 extends StatefulWidget {
  const Onboarding_3_6({super.key});

  @override
  State<Onboarding_3_6> createState() => _Onboarding_3_6State();
}

class _Onboarding_3_6State extends State<Onboarding_3_6> {
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
                "4. How experienced with planning are you?",
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
            MaterialPageRoute(builder: (_) => Onboarding_3_7()),
          );
        },
      ),
    );
  }
}
