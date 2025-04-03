import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/calendar_scheduler.dart';
import 'package:remember_demos/widgets/date_carousel.dart';
import 'package:remember_demos/widgets/left_menu.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/task_row_small.dart';
import 'package:remember_demos/widgets/utils.dart';

class HomeScreen12 extends StatefulWidget {
  const HomeScreen12({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen12State();
}

class _HomeScreen12State extends State<HomeScreen12> {
  int get todoLimit => rand.nextInt(20);

  late var toDoTasks = List.generate(todoLimit,
      (i) => randomBasicTask(taskType: 1, scheduledTime: randomScheduledTime))
    ..sort((a, b) => a.priority.compareTo(b.priority));
  var scheduledTasks = List.generate(10,
      (i) => randomBasicTask(taskType: 2, scheduledTime: randomScheduledTime))
    ..sort((a, b) => b.scheduledTime == null
        ? 0
        : a.scheduledTime?.compareTo(b.scheduledTime!) ?? 0);

  DateTime _dateToShow = DateTime.now();
  bool isOpen = false;
  final dateCarouselKey = GlobalKey();
  final expansionTileTitleKey = GlobalKey();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  double MAX_TODO_HEIGHT = 250;
  double MIN_TODO_HEIGHT = 40;
  double APROX_SIZE_OF_TILE = 43;
  double get todoSize => min(MAX_TODO_HEIGHT,
      max(MIN_TODO_HEIGHT, toDoTasks.length * APROX_SIZE_OF_TILE + 30));

  bool shouldShowListView = false;

  void onCalendarPressed() async {
    print("Hello");
  }

  void onMenuPressed() async {
    scaffoldKey.currentState?.openDrawer();
  }

  Widget showToDoTasks() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            "To-Do Tasks",
            textAlign: TextAlign.center,
            style: boldSecondary.copyWith(fontSize: 16),
          ),
          Expanded(
            child: toDoTasks.isEmpty
                ? Text("    No to-do tasks for today")
                : SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        ...(toDoTasks
                              ..sort((t1, t2) =>
                                  (t1.completed ? 1 : 0) -
                                  (t2.completed ? 1 : 0)))
                            .map(
                          (t) => TaskRowSmall.fromBasicTask(
                            t,
                            forceOffScheduledTime: true,
                            customSize: 32,
                          ),
                        ),
                        const SizedBox(width: 50),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget getListView() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Text(
            "To-Do Tasks",
            style: boldSecondary.copyWith(fontSize: 16),
          ),
          ...toDoTasks.map(
            (task) => TaskRowSmall.fromBasicTask(
              task,
              customSize: 32,
              forceOffScheduledTime: true,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Scheduled Tasks",
            style: boldSecondary.copyWith(fontSize: 16),
          ),
          ...scheduledTasks.map((t) => TaskRow.fromBasicTask(
                t,
                forceOffScheduledTime: true,
                showStartAndEndTimes: true,
                scheduledTimeStyle: mediumPrimary.copyWith(fontSize: 12),
              )),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: RememberColors.light,
        shadowColor: Colors.black,
        elevation: 2,
        automaticallyImplyLeading: true, // makes the menu button
        title: DateCarousel(
          key: dateCarouselKey,
          // fontSize: 17,
          currentDate: _dateToShow,
          onDateChanged: (date) {
            _dateToShow = date;
          },
        ),
        leading: SizedBox(
          width: 40,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Switch.adaptive(
              value: shouldShowListView,
              onChanged: (value) {
                setState(() {
                  shouldShowListView = value;
                });
              },
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            onPressed: onCalendarPressed,
          ),
          // Make the switch smaller so that it fits in the space
        ],
        bottom: shouldShowListView
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(todoSize),
                child: SizedBox(height: todoSize, child: showToDoTasks()),
              ),
      ),
      body: shouldShowListView
          ? getListView()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Scheduled Tasks",
                    style: boldSecondary.copyWith(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: CalendarScheduler(
                    tasks: scheduledTasks,
                    dateToShow: _dateToShow,
                    showDatesInTaskRows: false,
                  ),
                ),
              ],
            ),
      drawer: LeftMenu(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          setState(() {
            toDoTasks = List.generate(
                todoLimit,
                (i) => randomBasicTask(
                    taskType: 1, scheduledTime: randomScheduledTime))
              ..sort((a, b) => a.priority.compareTo(b.priority));
          });
        },
        child: Icon(Icons.refresh),
      ),
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
