import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';

class VisualMind6 extends StatefulWidget {
  final String name;
  const VisualMind6({super.key, required this.name});

  @override
  State<VisualMind6> createState() => _VisualMind6State();
}

class _VisualMind6State extends State<VisualMind6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
            child: Text(
              "${widget.name}, would you like to set some goals?",
              style: semiBoldPrimary.copyWith(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
