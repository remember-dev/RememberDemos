import 'package:flutter/material.dart';
import 'package:remember_demos/demos/folders_with_priority.dart';
import 'package:remember_demos/demos/folders_with_priority_unassigned_on_top.dart';
import 'package:remember_demos/demos/home_screen_1.dart';
import 'package:remember_demos/demos/home_screen_2.dart';
import 'package:remember_demos/demos/home_screen_3.dart';
import 'package:remember_demos/demos/home_screen_4.dart';
import 'package:remember_demos/demos/tasks_with_priority.dart';
import 'package:remember_demos/demos/tasks_with_priority_reorderable.dart';
import 'package:remember_demos/settings_page.dart';
import 'package:remember_demos/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            const Spacer(),
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
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text("Folders with Priority (Unscheduled at the top)"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FoldersWithPriorityUnscheduledOnTop(),
                  ),
                );
              },
            ),
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
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
