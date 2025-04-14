import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/intro_screen_1.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
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
