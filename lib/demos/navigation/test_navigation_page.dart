import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';

class _TestNavigaitonPage extends StatelessWidget {
  const _TestNavigaitonPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform.rotate(
          angle: -pi / 6,
          child: Text(
            "This screen is a test",
            style: regularSecondary.copyWith(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

const testNavigationPage = _TestNavigaitonPage();
