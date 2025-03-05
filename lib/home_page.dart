import 'package:flutter/material.dart';
import 'package:remember_demos/demos/folders_with_priority.dart';
import 'package:remember_demos/demos/folders_with_priority_unassigned_on_top.dart';
import 'package:remember_demos/demos/tasks_with_priority.dart';
import 'package:remember_demos/demos/tasks_with_priority_reorderable.dart';
import 'package:remember_demos/settings_page.dart';
import 'package:remember_demos/text_styles.dart';

class HomePage extends StatefulWidget {
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
            const SizedBox(height: 64),
            Text(
              "Welcome to Remember Demos!",
              style: MOS.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text("Click the buttons below to see the demos."),
            const SizedBox(height: 32),
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
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
