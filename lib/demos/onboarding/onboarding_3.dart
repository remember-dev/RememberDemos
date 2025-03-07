import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/intro_screen_1.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => IntroScreenOne()),
          ),
          child: Text("Start flow"),
        ),
      ),
    );
  }
}
