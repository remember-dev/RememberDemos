import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';

class StepProgressView extends StatelessWidget {
  final List<String> titles;
  final int curStep; // This starts at 1
  final Color activeColor = Colors.black;
  final Color inactiveColor = Colors.white;

  const StepProgressView({
    super.key,
    required this.curStep,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _iconViews(),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...titles.mapIndexed(
              (i, text) => Text(
                text,
                style: curStep == i + 1 ? boldPrimary : mediumPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _iconViews() {
    var list = <Widget>[];
    titles.forEachIndexed((i, icon) {
      var lineColor = curStep > i + 1 ? activeColor : inactiveColor;
      var iconColor = curStep >= i + 1 ? activeColor : inactiveColor;

      list.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(Icons.circle, color: iconColor, size: 15),
        ),
      );

      if (i != titles.length - 1) {
        list.add(
          Expanded(
            child: Container(
              height: 3,
              color: lineColor,
            ),
          ),
        );
      }
    });

    return list;
  }
}
