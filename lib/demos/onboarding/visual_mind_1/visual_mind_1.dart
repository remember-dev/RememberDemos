import 'package:flutter/material.dart';
import 'visual_mind_2.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';

class VisualMind1 extends StatefulWidget {
  const VisualMind1({super.key});

  @override
  State<VisualMind1> createState() => _VisualMind1State();
}

class _VisualMind1State extends State<VisualMind1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          Image.asset('assets/typographic-logo.png'),
          const SizedBox(height: 80),
          Image.asset('assets/color-bar.png'),
          const Spacer(),
          Center(
            child: Text(
              'Live Life Better',
              style: semiBoldSecondary.copyWith(fontSize: 24),
            ),
          ),
          const SizedBox(height: 36),
          Image.asset(
            'assets/mark-transp.png',
            height: 100,
          ),
          const Spacer(flex: 2),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const VisualMind2()),
                );
              },
              style: primaryStyle,
              child: Text('Create your plan'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
