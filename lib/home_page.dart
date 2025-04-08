import 'package:flutter/material.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority_unassigned_on_top.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority_unassigned_on_top2.dart';
import 'package:remember_demos/demos/folders_and_priorities/folders_with_priority_unassigned_on_top3.dart';
import 'package:remember_demos/demos/home_screen/home_screen_1.dart';
import 'package:remember_demos/demos/home_screen/home_screen_11.dart';
import 'package:remember_demos/demos/home_screen/home_screen_12.dart';
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
import 'package:remember_demos/demos/planning/planning_values_2.dart';
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
              thing(
                "Tasks with Priority",
                TasksWithPriority(),
                "No folders. Reorderable",
              ),
              const SizedBox(height: 16),
              thing(
                "Tasks with Priority",
                TasksWithPriorityDD(),
                "No folders. Drag & Drop",
              ),
              const SizedBox(height: 16),
              thing(
                "Folders with Priority",
                FoldersWithPriority(),
                "Just folders and priorities",
              ),
              const SizedBox(height: 16),
              thing(
                "Unscheduled Tasks with Priority",
                FoldersWithPriorityUnscheduledOnTop(),
                "Unscheduled at the top",
              ),
              const SizedBox(height: 16),
              thing(
                "Unscheduled Tasks with Priority",
                FoldersWithPriorityUnscheduledOnTop2(),
                "Renamed the titles and labels",
              ),
              const SizedBox(height: 16),
              thing(
                "Unscheduled Tasks with Priority",
                FoldersWithPriorityUnscheduledOnTop3(),
                "Looooooooots of tasks",
              ),
              const SizedBox(height: 16),

              //
              title("Home Screen"),
              const SizedBox(height: 16),
              thing(
                "Home Screen 1 (current)",
                HomeScreen1(),
                "The current home screen as of March 6, 2025.",
              ),
              const SizedBox(height: 16),
              thing(
                "Home Screen 2",
                Navigation1(page: HomeScreen2()),
                "Switch in top right instead of user setting.",
              ),
              const SizedBox(height: 16),
              thing(
                "Home Screen 3",
                Navigation1(page: HomeScreen3()),
                "No bottom expansion tile. Switch shows what was in the bottom tile (Future and delegated tasks)",
              ),
              const SizedBox(height: 16),
              thing(
                "Home Screen 4",
                Navigation1(page: HomeScreen4()),
                "The 'Scheduled Tasks' tile is NOT expandable",
              ),
              const SizedBox(height: 16),
              thing(
                "Home Screen 5",
                Navigation1(page: HomeScreen5()),
                "The Google-Calendar look alike",
              ),
              const SizedBox(height: 16),
              thing(
                "Home Screen 6",
                Navigation1(page: HomeScreen6()),
                "The Google-Calendar look alike but more polished up",
              ),
              const SizedBox(height: 16),
              thing(
                "Home Screen 7",
                Navigation1(page: HomeScreen7()),
                "The Google-Calendar look alike but more spacing for To-Do items",
              ),
              const SizedBox(height: 16),
              thing("Home Screen 8", Navigation1(page: HomeScreen8()),
                  "The Google-Calendar look alike but EVEN more spacing for To-Do items"),
              const SizedBox(height: 16),
              thing("Home Screen 9", Navigation1(page: HomeScreen9()),
                  "With bottom app bar so that we can get a feel for spacing"),
              const SizedBox(height: 16),
              thing("Home Screen 10", Navigation1(page: HomeScreen10()),
                  "Dynamic spacing on the to-do list with a max height"),
              const SizedBox(height: 16),
              thing(
                "Home Screen 11",
                Navigation1(page: HomeScreen11()),
                "Even more spacing on To-Do list, Increased height of To-Do tiles, "
                    "move the To-Do text to center justified under DateCarousel, "
                    "remove the x/y count, checked To-Do items to the bottom, and ListView switch (too small)",
              ),
              const SizedBox(height: 16),
              thing(
                "Home Screen 12",
                Navigation1(page: HomeScreen12()),
                "Capitalize \"Tasks\", Center the date carousel relative to screen, "
                    "remove hamburger menu, move toggle to the left, remove the date "
                    "on the schedule screen and To Do list, separator between to do "
                    "and scheduled tasks, List view needs beginning and end time, "
                    "and time and priority real estate.",
              ),
              const SizedBox(height: 16),

              //
              title("Onboarding"),
              const SizedBox(height: 16),
              thing(
                "Onboarding 1 (current)",
                Onboarding1(),
                "The current onboarding process as of March 7th, 2025",
              ),
              const SizedBox(height: 16),
              thing(
                "Onboarding 2",
                Onboarding2(),
                "An idea of onboarding that mimics VisualMind",
              ),
              const SizedBox(height: 16),

              //
              title("Planning Process"),
              const SizedBox(height: 16),
              thing(
                "Planning Process 1 (current)",
                PlanningValues1(),
                "The current planning process as of March 7th, 2025",
              ),
              thing(
                "Planning Process 2",
                PlanningValues2(),
                "Planning process with no selection limits on values/goals/tasks. "
                    "(Max screens ≈200) (min screens 3). 'Depth-First-Traversal' going "
                    "from Value->Goal->Task->(to next goal/value)",
              ),
              const SizedBox(height: 16),

              //
              title("Task Creation"),
              const SizedBox(height: 16),
              thing(
                "Quick Task Bar 1 (current)",
                QuickTaskWrapper(quickTaskBarType: QuickTaskBar1),
                "The current Quick Task Bar as of March 25th, 2025",
              ),
              const SizedBox(height: 16),
              thing(
                "Quick Task Bar 2",
                QuickTaskWrapper(quickTaskBarType: QuickTaskBar2),
                "The Quick Task Bar 2 from a design by Lynn",
              ),
              const SizedBox(height: 16),

              //
              title("Bottom Navigation Bar"),
              const SizedBox(height: 16),
              thing(
                "Navigation bar 1 (current)",
                Navigation1(),
                "The current navigation bar as of March 20th, 2025",
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget thing(String buttonText, Widget destination, String subtitleText) {
    return Column(
      children: [
        const SizedBox(height: 16),
        button(buttonText, destination),
        subtitle(subtitleText),
      ],
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
