import 'package:flutter/material.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/widgets/remember_bottom_app_bar.dart';

class Onboarding_3_10 extends StatefulWidget {
  const Onboarding_3_10({super.key});

  @override
  State<Onboarding_3_10> createState() => _Onboarding_3_10State();
}

class _Onboarding_3_10State extends State<Onboarding_3_10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Text(
                "Paywall",
              ),
              const SizedBox(height: 32),
              Text(
                "(free trial)",
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => HomePage()),
            (_) => false,
          );
        },
      ),
    );
  }
}
