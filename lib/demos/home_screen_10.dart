import 'dart:math';

import 'package:flutter/material.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/calendar_scheduler.dart';
import 'package:remember_demos/widgets/date_carousel.dart';
import 'package:remember_demos/widgets/left_menu.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/task_row_small.dart';
import 'package:remember_demos/widgets/utils.dart';

class HomeScreen10 extends StatefulWidget {
  const HomeScreen10({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen10State();
}

class _HomeScreen10State extends State<HomeScreen10> {
  var toDoTasks = List.generate(3,
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

  void onCalendarPressed() async {
    print("Hello");
  }

  void onMenuPressed() async {
    scaffoldKey.currentState?.openDrawer();
  }

  Widget showToDoTasks() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Text(
            "To-do\n${toDoTasks.where((t) => t.completed).length}/${toDoTasks.length}",
            textAlign: TextAlign.center,
            style: regularSecondary,
          ),
        ),
        Expanded(
          child: toDoTasks.isEmpty
              ? Text("    No to-do tasks for today")
              : SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      ...toDoTasks.map(
                        (t) => TaskRowSmall.fromBasicTask(t,
                            forceOffScheduledTime: true),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                ),
        ),
        const SizedBox(width: 10),
      ],
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
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: onMenuPressed,
        ),
        title: DateCarousel(
          key: dateCarouselKey,
          currentDate: _dateToShow,
          onDateChanged: (date) {
            _dateToShow = date;
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month_outlined),
            onPressed: onCalendarPressed,
          ),
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(min(130, max(40, toDoTasks.length * 30 + 8))),
          child: SizedBox(
              height: min(130, max(40, toDoTasks.length * 30 + 8)),
              child: showToDoTasks()),
        ),
      ),
      body: CalendarScheduler(
        tasks: scheduledTasks,
        dateToShow: _dateToShow,
      ),
      drawer: LeftMenu(),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          setState(() {
            toDoTasks = List.generate(
                rand.nextInt(10),
                (i) => randomBasicTask(
                    taskType: 1, scheduledTime: randomScheduledTime))
              ..sort((a, b) => a.priority.compareTo(b.priority));
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget section(String title, List<BasicTask> tasks, {bool expanded = false}) {
    return ExpansionTile(
      initiallyExpanded: expanded,
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
