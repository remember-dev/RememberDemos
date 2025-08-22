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

class ValueGoalProcess3Button extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget label;
  final Color selectedColor;
  final Color? unselectedColor;
  final Widget? icon;
  final bool withBorder;

  const ValueGoalProcess3Button({
    super.key,
    this.onPressed,
    required this.label,
    required this.selectedColor,
    this.unselectedColor = Colors.transparent,
    this.icon,
    this.withBorder = false,
  });

  @override
  State<ValueGoalProcess3Button> createState() =>
      _ValueGoalProcess3ButtonState();
}

class _ValueGoalProcess3ButtonState extends State<ValueGoalProcess3Button> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            selected = !selected;
          });
          widget.onPressed?.call();
        },
        label: widget.label,
        icon: widget.icon,
        style: ButtonStyle(
          side: WidgetStatePropertyAll(
            BorderSide(width: 1, color: Color(0xFFD2D2D2)),
          ),
          textStyle:
              WidgetStatePropertyAll(regularPrimary.copyWith(fontSize: 16)),
          backgroundColor: WidgetStatePropertyAll(
            selected ? widget.selectedColor : widget.unselectedColor,
          ),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 21, vertical: 10),
          ),
        ),
      ),
    );
  }
}
