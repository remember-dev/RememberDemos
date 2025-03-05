import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:intl/intl.dart';

class DateCarousel extends StatefulWidget {
  /// The date to be shown on the carousel. This esentially "overrides"
  /// whatever other date was there. For example: when the page wants to
  /// show a different date than today or jump to a new date.
  final DateTime? currentDate;

  /// Callback for when the date changes
  final Function(DateTime) onDateChanged;
  final bool byMonths;

  const DateCarousel({
    super.key,
    this.currentDate,
    required this.onDateChanged,
    this.byMonths = false,
  });

  @override
  State<StatefulWidget> createState() => _DateCarouselState();
}

class _DateCarouselState extends State<DateCarousel> {
  late DateTime _currentDate = widget.currentDate ?? DateTime.now();

  void _onPressLeft() {
    if (widget.byMonths) {
      _currentDate = _currentDate.copyWith(month: _currentDate.month - 1);
    } else {
      _currentDate = _currentDate.subtract(const Duration(days: 1));
    }
    widget.onDateChanged(_currentDate);
    setState(() {});
  }

  void _onPressRight() {
    if (widget.byMonths) {
      _currentDate = _currentDate.copyWith(month: _currentDate.month + 1);
    } else {
      _currentDate = _currentDate.add(const Duration(days: 1));
    }
    widget.onDateChanged(_currentDate);
    setState(() {});
  }

  void _onPressCenter() {
    _currentDate = DateTime.now();
    widget.onDateChanged(_currentDate);
    setState(() {});
  }

  bool _isToday() {
    var now = DateTime.now();
    return _currentDate.day == now.day &&
        _currentDate.month == now.month &&
        _currentDate.year == now.year;
  }

  // This function was added because we need to update the `_currentDate`
  // anytime that the widget changes.
  @override
  void didUpdateWidget(covariant DateCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currentDate = widget.currentDate ?? _currentDate;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // The left button
        IconButton(
          key: const Key('TaskEdit_TextButton_PreviusDay'),
          onPressed: _onPressLeft,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),

        // The Day text
        if (!widget.byMonths)
          Text(
            DateFormat('EEE ').format(_currentDate),
            style: semiBoldSecondary.copyWith(
              fontSize: 20,
              color: _isToday() ? RememberColors.lightBlue : Colors.black,
            ),
          ),

        // The Month text
        Text(
          DateFormat('MMM ').format(_currentDate),
          style: semiBoldSecondary.copyWith(
            fontSize: 20,
            color: _isToday() ? RememberColors.lightBlue : Colors.black,
          ),
        ),

        // The (optional) Day text if not `byMonths`
        !widget.byMonths
            ? GestureDetector(
                key: const Key("TaskEdit_TextButton_Today"),
                onTap: _onPressCenter,
                child: Text(
                  DateFormat('d').format(_currentDate),
                  style: semiBoldSecondary.copyWith(
                    fontSize: 20,
                    color: _isToday() ? RememberColors.lightBlue : Colors.black,
                  ),
                ),
              )
            : Text(" ", style: semiBoldSecondary.copyWith(fontSize: 20)),
        if (!widget.byMonths)
          Text(',',
              style: semiBoldSecondary.copyWith(
                fontSize: 20,
                color: _isToday() ? RememberColors.lightBlue : Colors.black,
              )),
        // The years text
        Text(
          DateFormat(' yyyy').format(_currentDate),
          style: semiBoldSecondary.copyWith(
            fontSize: 20,
            color: _isToday() ? RememberColors.lightBlue : Colors.black,
          ),
        ),

        // The right button
        IconButton(
          key: const Key('TaskEdit_TextButton_NextDay'),
          onPressed: _onPressRight,
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
