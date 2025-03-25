import 'package:flutter/material.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority_unassigned_on_top.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority_unassigned_on_top2.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority_unassigned_on_top3.dart';
import 'package:remember_demos/demos/home_screen/home_screen_1.dart';
import 'package:remember_demos/demos/home_screen/home_screen_2.dart';
import 'package:remember_demos/demos/home_screen/home_screen_3.dart';
import 'package:remember_demos/demos/home_screen/home_screen_4.dart';
import 'package:remember_demos/demos/home_screen/home_screen_5.dart';
import 'package:remember_demos/demos/home_screen/home_screen_6.dart';
import 'package:remember_demos/demos/home_screen/home_screen_7.dart';
import 'package:remember_demos/demos/home_screen/home_screen_8.dart';
import 'package:remember_demos/demos/home_screen/home_screen_9.dart';
import 'package:remember_demos/demos/home_screen/home_screen_10.dart';
import 'package:remember_demos/demos/navigation/navigation_1.dart';
import 'package:remember_demos/demos/onboarding/onboarding_1.dart';
import 'package:remember_demos/demos/onboarding/onboarding_2.dart';
import 'package:remember_demos/demos/planning/planning_values_1.dart';
import 'package:remember_demos/demos/folders_and_priorities/tasks_with_priority.dart';
import 'package:remember_demos/demos/folders_and_priorities/tasks_with_priority_reorderable.dart';
import 'package:remember_demos/demos/task_creation/quick_task_bar_2.dart';
import 'package:remember_demos/demos/task_creation/quick_task_bar_current.dart';
import 'package:remember_demos/demos/task_creation/quick_task_wrapper.dart';
import 'package:remember_demos/settings_page.dart';
import 'package:remember_demos/text_styles.dart';

GlobalKey navigatorKey = GlobalKey<State<StatefulWidget>>();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: navigatorKey,
      body: Center(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SettingsPage()));
                    },
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Image.asset("assets/typographic-logo.png"),
              const SizedBox(height: 32),
              Text(
                "Welcome to Remember Demos!",
                style: semiBoldSecondary.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                "Click the buttons below to see the demos.",
                style: mediumPrimary,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Divider(color: Color.fromARGB(255, 13, 81, 199)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Folders and Prioritization",
                    style: semiBoldSecondary.copyWith(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Tasks with Priority (no folders) (Reorderable)"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TasksWithPriority()),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Tasks with Priority (no folders) (Drag&Drop)"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TasksWithPriorityDD()),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Folders with Priority"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FoldersWithPriority()),
                  );
                },
              ),
              _subtitleText("Just folders and priorities"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Folders with Priority"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoldersWithPriorityUnscheduledOnTop(),
                    ),
                  );
                },
              ),
              _subtitleText("Unscheduled at the top"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Folders with Priority"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FoldersWithPriorityUnscheduledOnTop2()),
                  );
                },
              ),
              _subtitleText("Renamed the titles and labels"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Folders with Priority"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FoldersWithPriorityUnscheduledOnTop3()),
                  );
                },
              ),
              _subtitleText("Looooooooots of tasks"),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Divider(color: Color.fromARGB(255, 13, 81, 199)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Home Screen",
                    style: semiBoldSecondary.copyWith(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 1 (current)"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen1(),
                    ),
                  );
                },
              ),
              _subtitleText("The current home screen as of March 6, 2025."),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 2"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen2(),
                    ),
                  );
                },
              ),
              _subtitleText("Switch in top right instead of user setting."),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 3"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen3(),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "No bottom expansion tile. Switch shows what was in the bottom tile (Future and delegated tasks)"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 4"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen4(),
                    ),
                  );
                },
              ),
              _subtitleText("The 'Scheduled Tasks' tile is NOT expandable"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 5"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen5(),
                    ),
                  );
                },
              ),
              _subtitleText("The Google-Calendar look alike"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 6"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen6(),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "The Google-Calendar look alike but more polished up"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 7"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen7(),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "The Google-Calendar look alike but more spacing for todo items"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 8"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomeScreen8(),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "The Google-Calendar look alike but EVEN more spacing for todo items"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 9"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Navigation1(page: HomeScreen9()),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "With bottom app bar so that we can get a feel for spacing"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Home Screen 10"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Navigation1(page: HomeScreen10()),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "Dynamic spacing on the to-do list with a max height"),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Divider(color: Color.fromARGB(255, 13, 81, 199)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Onboarding",
                    style: semiBoldSecondary.copyWith(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Onboarding 1 (current)"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Onboarding1(),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "The current onboarding process as of March 7th, 2025"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Onboarding 2"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Onboarding2(),
                    ),
                  );
                },
              ),
              _subtitleText("An idea of onboarding that mimics VisualMind"),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Divider(color: Color.fromARGB(255, 13, 81, 199)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Planning Process",
                    style: semiBoldSecondary.copyWith(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Planning Process 1 (current)"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlanningValues1(),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "The current planning process as of March 7th, 2025"),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Divider(color: Color.fromARGB(255, 13, 81, 199)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Task Creation",
                    style: semiBoldSecondary.copyWith(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Quick Task Bar 1 (current)"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuickTaskWrapper(
                        quickTaskBarType: QuickTaskBarCurrent,
                      ),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "The current Quick Task Bar as of March 25th, 2025"),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Quick Task Bar 2"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuickTaskWrapper(
                        quickTaskBarType: QuickTaskBar2,
                      ),
                    ),
                  );
                },
              ),
              _subtitleText("The Quick Task Bar 2 from a design by Lynn"),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: const Divider(color: Color.fromARGB(255, 13, 81, 199)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bottom Navigation Bar",
                    style: semiBoldSecondary.copyWith(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: Text("Navigation bar 1 (current)"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Navigation1(),
                    ),
                  );
                },
              ),
              _subtitleText(
                  "The current navigation bar as of March 20th, 2025"),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget _subtitleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
