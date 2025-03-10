import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';

class SelectableButton extends StatelessWidget {
  final bool selected;
  final VoidCallback? onPressed;
  final Widget label;
  final Color selectedColor;
  final Widget? icon;

  const SelectableButton({
    super.key,
    required this.selected,
    this.onPressed,
    required this.label,
    required this.selectedColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: label,
      icon: icon,
      style: ButtonStyle(
        textStyle:
            WidgetStatePropertyAll(regularPrimary.copyWith(fontSize: 16)),
        backgroundColor: WidgetStatePropertyAll(
          selected ? selectedColor : Colors.white,
        ),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 18),
        ),
      ),
    );
  }
}
