import 'package:flutter/material.dart';
import 'package:remember_demos/demos/onboarding/visual_mind_1/visual_mind_1.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => VisualMind1()),
          ),
          child: Text("Start VisualMind mockup flow"),
        ),
      ),
    );
  }
}
