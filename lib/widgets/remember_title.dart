import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';

class RememberTitle extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;

  const RememberTitle({
    super.key,
    required this.title,
    this.showBackArrow = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<StatefulWidget> createState() => _RememberTitleState();
}

class _RememberTitleState extends State<RememberTitle> {
  _RememberTitleState();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: widget.showBackArrow,
      title: Text(
        widget.title,
        style: semiBoldPrimary.copyWith(fontSize: 27),
      ),
    );
  }
}
