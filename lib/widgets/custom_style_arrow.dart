import 'package:flutter/material.dart';

class CustomStyleArrow extends CustomPainter {
  int totalSteps;
  int currentStep;

  CustomStyleArrow({
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    const double triangleH = 12;
    const double triangleW = 6.0;
    final double width = size.width;

    var x = width * (currentStep - 1) / (totalSteps - 1);

    final Path trianglePath = Path()
      ..moveTo(x - triangleW, 0)
      ..lineTo(x, -triangleH)
      ..lineTo(x + triangleW, 0)
      ..close();

    canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
