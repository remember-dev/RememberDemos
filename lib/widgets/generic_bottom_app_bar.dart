import 'package:flutter/material.dart';

/// A [BottomAppBar] that has the Remember color-bar above it.
class GenericBottomAppBar extends StatefulWidget {
  final List<Widget> children;

  const GenericBottomAppBar({
    super.key,
    required this.children,
  });

  @override
  State<StatefulWidget> createState() => _GenericBottomAppBarState();
}

class _GenericBottomAppBarState extends State<GenericBottomAppBar> {
  _GenericBottomAppBarState();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BottomAppBar(
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            alignment: MainAxisAlignment.center,
            overflowSpacing: 5.0,
            children: widget.children,
          ),
        ),
        Image.asset(
          "assets/color-bar.png",
          width: MediaQuery.of(context).size.width,
          height: 5,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
