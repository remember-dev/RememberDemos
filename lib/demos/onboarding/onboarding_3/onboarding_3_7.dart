import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/onboarding_3/onboarding_3_8.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_7 extends StatefulWidget {
  const Onboarding_3_7({super.key});

  @override
  State<Onboarding_3_7> createState() => _Onboarding_3_7State();
}

class _Onboarding_3_7State extends State<Onboarding_3_7> {
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
                "5. How do you set goals (large dreams, vs small bite sized)",
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
            MaterialPageRoute(builder: (_) => Onboarding_3_8()),
          );
        },
      ),
    );
  }
}
