import 'package:flutter/material.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/calendar_scheduler.dart';
import 'package:remember_demos/widgets/date_carousel.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/utils.dart';

const double _MIN_EXPANSION_TILE_HEIGHT = 300;

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  var toDoTasks = List.generate(10,
      (i) => randomBasicTask(taskType: 1, scheduledTime: randomScheduledTime))
    ..sort((a, b) => a.scheduledTime?.compareTo(b.scheduledTime!) ?? 0);
  var masterListTasks = List.generate(
      10, (i) => randomBasicTask(taskType: 0, scheduledTime: null))
    ..sort((a, b) => b.scheduledTime == null
        ? 0
        : a.scheduledTime?.compareTo(b.scheduledTime!) ?? 0);
  var scheduledTasks = List.generate(10,
      (i) => randomBasicTask(taskType: 2, scheduledTime: randomScheduledTime))
    ..sort((a, b) => b.scheduledTime == null
        ? 0
        : a.scheduledTime?.compareTo(b.scheduledTime!) ?? 0);
  var delegatedFromMeTasks = List.generate(10, (i) => randomBasicTask())
    ..sort((a, b) => b.scheduledTime == null
        ? 0
        : a.scheduledTime?.compareTo(b.scheduledTime!) ?? 0);

  DateTime _dateToShow = DateTime.now();
  double tileHeight = _MIN_EXPANSION_TILE_HEIGHT;
  bool showListView = false;
  bool isOpen = false;
  final dateCarouselKey = GlobalKey();
  final expansionTileTitleKey = GlobalKey();

  void onCalendarPressed() async {
    print("Hello");
  }

  Widget showScheduledTasks() {
    if (showListView) {
      return ListView.builder(
        itemCount: scheduledTasks.length,
        itemBuilder: (context, index) {
          return TaskRow.fromBasicTask(scheduledTasks[index]);
        },
      );
    }

    return CalendarScheduler(tasks: scheduledTasks, dateToShow: _dateToShow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(width: 48 + 52),
                const Spacer(),
                DateCarousel(
                  key: dateCarouselKey,
                  currentDate: _dateToShow,
                  onDateChanged: (date) {
                    _dateToShow = date;
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.calendar_month_outlined),
                  onPressed: onCalendarPressed,
                ),
                Switch.adaptive(
                  value: showListView,
                  onChanged: (value) {
                    setState(() {
                      showListView = value;
                    });
                  },
                ),
              ],
            ),
          ),

          // Expanded widget will take up the remaining space available
          Expanded(
            child: showScheduledTasks(),
          ),

          // The bottom portion of the screen
          ExpansionTile(
            // TODO: These colors should be replaced with [RememberColors.color]
            collapsedBackgroundColor: const Color(0xFFADABAB),
            backgroundColor: const Color(0xFFADABAB),
            // Reverse the icons because this tile expands from the bottom (which
            //  is not how they normally work)
            trailing: isOpen
                ? const Icon(Icons.expand_more)
                : const Icon(Icons.expand_less),
            onExpansionChanged: (value) {
              setState(() => isOpen = value);
            },
            initiallyExpanded: isOpen,
            maintainState: true,
            title: Row(
              key: expansionTileTitleKey,
              children: [
                const Spacer(),
                Text(
                  "    Today's Tasks / Future Tasks",
                  style: boldSecondary.copyWith(fontSize: 16),
                ),
                const Spacer(),
                isOpen
                    ? IconButton(
                        icon: Icon(
                          tileHeight == _MIN_EXPANSION_TILE_HEIGHT
                              ? Icons.open_in_full
                              : Icons.close_fullscreen,
                        ),
                        onPressed: () {
                          final double remainingHeight = getExpansionHeight();
                          setState(() {
                            tileHeight =
                                tileHeight == _MIN_EXPANSION_TILE_HEIGHT
                                    ? remainingHeight
                                    : _MIN_EXPANSION_TILE_HEIGHT;
                          });
                        },
                      )
                    : Container(width: 48),
              ],
            ),
            children: [
              Container(
                height: tileHeight,
                decoration: BoxDecoration(
                  color: RememberColors.regular,
                  border: Border.all(color: Colors.black),
                ),
                child: RawScrollbar(
                  thumbColor: Colors.grey.shade700,
                  thumbVisibility: true,
                  radius: const Radius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 14),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          section("Today's Tasks", toDoTasks),
                          section("Future Tasks", masterListTasks),
                          section("Delegated Tasks", delegatedFromMeTasks),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget section(String title, List<BasicTask> tasks) {
    return ExpansionTile(
      title: Center(
        child: Text(
          title,
          style: boldSecondary.copyWith(fontSize: 16),
        ),
      ),
      children: [
        ...tasks.map(
          (t) => TaskRow.fromBasicTask(t),
        ),
      ],
    );
  }

  double getExpansionHeight() {
    final cBox = dateCarouselKey.currentContext?.findRenderObject();
    final cOffset = (cBox as RenderBox).localToGlobal(Offset.zero);
    final cY = cOffset.dy + cBox.size.height;

    final eBox = expansionTileTitleKey.currentContext?.findRenderObject();
    final eHeight = (eBox as RenderBox).size.height;

    // total height - bottomnavbar.height - (datecarousel.y - datecarousel.height)
    //   - expansiontile row height - (some constant to account for padding)
    return MediaQuery.of(context).size.height - 80 - (cY) - eHeight - (30);
  }
}
