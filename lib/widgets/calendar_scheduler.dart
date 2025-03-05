import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/utils.dart';

const int DEFAULT_SCHEDULE_DURATION_MINUTES = 60;

class CalendarScheduler extends StatefulWidget {
  final List<BasicTask> tasks;
  final DateTime? dateToShow;

  const CalendarScheduler({
    super.key,
    required this.tasks,
    this.dateToShow,
  });

  @override
  State<CalendarScheduler> createState() => _CalendarSchedulerState();
}

/// The vertical space for each hour segment. Each TaskRow should take up some
/// fraction of this height depending on its scheduled duration length.
const double HEIGHT_PER_HOUR = 80;

/// The amount of hours in the past that the scrollview should default to
/// ex: If the time is 11:20, we should start the calendar scroll view at 10:30
const double _DEFAULT_SCROLL_OFFSET_HOURS = 0.5;

class _CalendarSchedulerState extends State<CalendarScheduler> {
  late final scrollControler = ScrollController(
    initialScrollOffset: DateTime.now().hour != 0
        ? (DateTime.now().hour - _DEFAULT_SCROLL_OFFSET_HOURS) * HEIGHT_PER_HOUR
        : 0,
  );
  Widget? creatingTaskShadow;

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width - 60;

    return SingleChildScrollView(
      controller: scrollControler,
      // Calendar Background
      // Stack with the TaskRow widgets shown on top of the times
      child: Stack(
        children: [
          getCalendarBackground(),
          ...generateScheduledItems(totalWidth),
          getBlueLineForCurrentHour(),
          creatingTaskShadow ?? const SizedBox(),
        ],
      ),
    );
  }

  Widget getCalendarBackground() {
    return Column(
      children: List.generate(24, (hour) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${hour == 0 ? 12 : hour > 12 ? hour - 12 : hour}${hour >= 12 ? " PM" : " AM"}",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onLongPressStart: (details) => onLongPress(details, hour),
                child: Container(
                  height: HEIGHT_PER_HOUR,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void onLongPress(details, int hour) async {
    HapticFeedback.vibrate();
    final pos = details.localPosition;
    final int minute = getMinuteFromRelativePosition(pos.dy);
    var scheduledTime = roundToClosestHalfHour(
        DateTime.now().copyWith(hour: hour, minute: minute));

    setState(() {
      creatingTaskShadow = getShadow(scheduledTime);
    });

    await Future.delayed(Duration(seconds: 2));
    if (mounted) setState(() => creatingTaskShadow = null);
  }

  Widget getShadow(DateTime time) {
    var totalWidth = MediaQuery.of(context).size.width - 60;
    return Positioned(
      top: calculateTopPosition(time.hour, time.minute),
      left: 50,
      child: Container(
        height: HEIGHT_PER_HOUR,
        width: totalWidth,
        decoration: BoxDecoration(
          color: RememberColors.gray.withAlpha(0x88),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text("\n  Example creation of task..."),
      ),
    );
  }

  List<Widget> generateScheduledItems(double totalWidth) {
    final List<Widget> widgets = [];

    for (final task in widget.tasks) {
      // NOTE: There is an assert statement to make sure that all widgets have a scheudledTime
      if (task.scheduledTime == null) break; // Skip them anyways just in case.
      final int startHour = task.scheduledTime!.toLocal().hour;
      final int startMinute = task.scheduledTime!.toLocal().minute;
      final int durationMinutes =
          task.scheduledDuration ?? DEFAULT_SCHEDULE_DURATION_MINUTES;

      widgets.add(
        Positioned(
          top: calculateTopPosition(startHour, startMinute),
          left: 50,
          child: SizedBox(
            width: totalWidth,
            child: TaskRow.fromBasicTask(task),
          ),
        ),
      );
    }

    return widgets;
  }

  Widget getBlueLineForCurrentHour() {
    return Positioned(
      top: calculateTopPosition(DateTime.now().hour, DateTime.now().minute),
      child: Container(
        height: 1,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
      ),
    );
  }

  double calculateTopPosition(int hour, int minute) {
    return (hour * HEIGHT_PER_HOUR) + (minute / 60 * HEIGHT_PER_HOUR);
  }

  /// We already know the hour because it comes from listview generate.
  /// This function should be used with relative position from the calling
  /// widget.
  ///
  /// Linear relationship where dy = 0          : 0  minutes
  ///                           dy = max height : 59 minutes
  int getMinuteFromRelativePosition(double yPosition) {
    return (yPosition / HEIGHT_PER_HOUR * 60).round();
  }
}
