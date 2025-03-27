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
import 'package:remember_demos/demos/task_creation/quick_task_bar_1.dart';
import 'package:remember_demos/demos/task_creation/quick_task_bar_2.dart';
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

              //
              title("Folders and Prioritization"),
              const SizedBox(height: 16),
              button(
                "Tasks with Priority (no folders) (Reorderable)",
                TasksWithPriority(),
              ),
              const SizedBox(height: 16),
              button(
                "Tasks with Priority (no folders) (Drag&Drop)",
                TasksWithPriorityDD(),
              ),
              const SizedBox(height: 16),
              button("Folders with Priority", FoldersWithPriority()),
              subtitle("Just folders and priorities"),
              const SizedBox(height: 16),
              button(
                "Unscheduled Tasks with Priority",
                FoldersWithPriorityUnscheduledOnTop(),
              ),
              subtitle("Unscheduled at the top"),
              const SizedBox(height: 16),
              button(
                "Unscheduled Tasks with Priority",
                FoldersWithPriorityUnscheduledOnTop2(),
              ),
              subtitle("Renamed the titles and labels"),
              const SizedBox(height: 16),
              button(
                "Unscheduled Tasks with Priority",
                FoldersWithPriorityUnscheduledOnTop3(),
              ),
              subtitle("Looooooooots of tasks"),
              const SizedBox(height: 16),

              //
              title("Home Screen"),
              const SizedBox(height: 16),
              button("Home Screen 1 (current)", HomeScreen1()),
              subtitle("The current home screen as of March 6, 2025."),
              const SizedBox(height: 16),
              button("Home Screen 2", Navigation1(page: HomeScreen2())),
              subtitle("Switch in top right instead of user setting."),
              const SizedBox(height: 16),
              button("Home Screen 3", Navigation1(page: HomeScreen3())),
              subtitle(
                  "No bottom expansion tile. Switch shows what was in the bottom tile (Future and delegated tasks)"),
              const SizedBox(height: 16),
              button("Home Screen 4", Navigation1(page: HomeScreen4())),
              subtitle("The 'Scheduled Tasks' tile is NOT expandable"),
              const SizedBox(height: 16),
              button("Home Screen 5", Navigation1(page: HomeScreen5())),
              subtitle("The Google-Calendar look alike"),
              const SizedBox(height: 16),
              button("Home Screen 6", Navigation1(page: HomeScreen6())),
              subtitle("The Google-Calendar look alike but more polished up"),
              const SizedBox(height: 16),
              button("Home Screen 7", Navigation1(page: HomeScreen7())),
              subtitle(
                  "The Google-Calendar look alike but more spacing for todo items"),
              const SizedBox(height: 16),
              button("Home Screen 8", Navigation1(page: HomeScreen8())),
              subtitle(
                  "The Google-Calendar look alike but EVEN more spacing for todo items"),
              const SizedBox(height: 16),
              button("Home Screen 9", Navigation1(page: HomeScreen9())),
              subtitle(
                  "With bottom app bar so that we can get a feel for spacing"),
              const SizedBox(height: 16),
              button("Home Screen 10", Navigation1(page: HomeScreen10())),
              subtitle("Dynamic spacing on the to-do list with a max height"),
              const SizedBox(height: 16),

              //
              title("Onboarding"),
              const SizedBox(height: 16),
              button("Onboarding 1 (current)", Onboarding1()),
              subtitle("The current onboarding process as of March 7th, 2025"),
              const SizedBox(height: 16),
              button("Onboarding 2", Onboarding2()),
              subtitle("An idea of onboarding that mimics VisualMind"),
              const SizedBox(height: 16),

              //
              title("Planning Process"),
              const SizedBox(height: 16),
              button("Planning Process 1 (current)", PlanningValues1()),
              subtitle("The current planning process as of March 7th, 2025"),
              const SizedBox(height: 16),

              //
              title("Task Creation"),
              const SizedBox(height: 16),
              button(
                "Quick Task Bar 1 (current)",
                QuickTaskWrapper(quickTaskBarType: QuickTaskBar1),
              ),
              subtitle("The current Quick Task Bar as of March 25th, 2025"),
              const SizedBox(height: 16),
              button(
                "Quick Task Bar 2",
                QuickTaskWrapper(quickTaskBarType: QuickTaskBar2),
              ),
              subtitle("The Quick Task Bar 2 from a design by Lynn"),
              const SizedBox(height: 16),

              //
              title("Bottom Navigation Bar"),
              const SizedBox(height: 16),
              button("Navigation bar 1 (current)", Navigation1()),
              subtitle("The current navigation bar as of March 20th, 2025"),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String text, Widget destination) {
    return ElevatedButton(
      child: Text(text),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => destination));
      },
    );
  }

  Widget title(String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: const Divider(color: Color.fromARGB(255, 13, 81, 199)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: semiBoldSecondary.copyWith(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget subtitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
