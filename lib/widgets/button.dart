import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';

class SelectableButton extends StatelessWidget {
  final bool selected;
  final VoidCallback? onPressed;
  final Widget label;
  final Color selectedColor;
  final Color? unselectedColor;
  final Widget? icon;
  final bool withBorder;

  const SelectableButton({
    super.key,
    required this.selected,
    this.onPressed,
    required this.label,
    required this.selectedColor,
    this.unselectedColor,
    this.icon,
    this.withBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: TextButton.icon(
        onPressed: onPressed,
        label: label,
        icon: icon,
        style: ButtonStyle(
          side: withBorder
              ? WidgetStatePropertyAll(
                  BorderSide(width: 0.5, color: Colors.grey),
                )
              : null,
          textStyle:
              WidgetStatePropertyAll(regularPrimary.copyWith(fontSize: 16)),
          backgroundColor: WidgetStatePropertyAll(
            selected ? selectedColor : unselectedColor ?? Colors.white,
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 18),
          ),
        ),
      ),
    );
  }
}
