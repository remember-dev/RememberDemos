import 'package:flutter/material.dart';
import 'package:remember_demos/entities/basic_task.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';
import 'package:remember_demos/widgets/date_carousel.dart';
import 'package:remember_demos/widgets/google_calendar_scheduler.dart';
import 'package:remember_demos/widgets/left_menu.dart';
import 'package:remember_demos/widgets/task_row.dart';
import 'package:remember_demos/widgets/utils.dart';

const double _MIN_EXPANSION_TILE_HEIGHT = 300;

class HomeScreen5 extends StatefulWidget {
  const HomeScreen5({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen5State();
}

class _HomeScreen5State extends State<HomeScreen5> {
  var toDoTasks = List.generate(5,
      (i) => randomBasicTask(taskType: 1, scheduledTime: randomScheduledTime))
    ..sort((a, b) => a.scheduledTime?.compareTo(b.scheduledTime!) ?? 0);
  var scheduledTasks = List.generate(10,
      (i) => randomBasicTask(taskType: 2, scheduledTime: randomScheduledTime))
    ..sort((a, b) => b.scheduledTime == null
        ? 0
        : a.scheduledTime?.compareTo(b.scheduledTime!) ?? 0);

  DateTime _dateToShow = DateTime.now();
  double tileHeight = _MIN_EXPANSION_TILE_HEIGHT;
  bool showListView = false;
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
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Text(
              "To-do",
              textAlign: TextAlign.center,
              style: regularSecondary,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  ...toDoTasks.map(
                    (t) =>
                        TaskRow.fromBasicTask(t, forceOffScheduledTime: true),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget showScheduledTasks() {
    if (showListView) {
      return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(children: [
          Text(
            "Scheduled Tasks",
            style: boldSecondary.copyWith(fontSize: 16),
          ),
          ...scheduledTasks.map((t) => TaskRow.fromBasicTask(t)),
          section("Today's Tasks", toDoTasks),
        ]),
      );
    }

    return GoogleCalendarScheduler(
      tasks: scheduledTasks,
      dateToShow: _dateToShow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: LeftMenu(),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: RememberColors.light,
                boxShadow: [
                  BoxShadow(
                    color: RememberColors.gray,
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: onMenuPressed,
                        ),
                        const SizedBox(width: 48),
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
                        // Switch.adaptive(
                        //   value: showListView,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       showListView = value;
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                  ),

                  // The to-do tasks for the day
                  showToDoTasks(),
                ],
              ),
            ),
          ),

          const SizedBox(height: 4),

          // Expanded widget will take up the remaining space available
          Expanded(
            child: showScheduledTasks(),
          ),
        ],
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
