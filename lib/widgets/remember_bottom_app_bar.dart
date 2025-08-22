import 'package:flutter/material.dart';
import 'package:remember_demos/theme.dart';

class RememberBottomAppBar extends StatefulWidget {
  final String leftText;
  final String rightText;
  final VoidCallback? onPressedLeft;
  final VoidCallback? onPressedRight;
  final bool leftEnabled;
  final bool rightEnabled;

  const RememberBottomAppBar({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.onPressedLeft,
    required this.onPressedRight,
    this.leftEnabled = false,
    this.rightEnabled = false,
  });

  @override
  State<StatefulWidget> createState() => _RememberBottomAppBarState();
}

class _RememberBottomAppBarState extends State<RememberBottomAppBar> {
  _RememberBottomAppBarState();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BottomAppBar(
          key: Key('BottomApp${widget.rightEnabled}'),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            overflowSpacing: 5.0,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: widget.leftEnabled
                        ? RememberButtonStyles.primary
                        : RememberButtonStyles.secondary,
                    onPressed: widget.onPressedLeft,
                    child: Text(widget.leftText),
                  ),
                  const SizedBox(width: 32),
                  ElevatedButton(
                    style: widget.rightEnabled
                        ? RememberButtonStyles.primary
                        : RememberButtonStyles.secondary,
                    onPressed: widget.onPressedRight,
                    child: Text(widget.rightText),
                  ),
                ],
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/color-bar.png',
          width: MediaQuery.of(context).size.width,
          height: 8,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
