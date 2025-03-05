import 'package:flutter/material.dart';
import 'package:remember_demos/main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final fonts = [
    //
    "Metropolis", "Montserrat", "Quicksand", "Lora", "Nunito", "Lobster"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text("Header Font", style: TextStyle(fontSize: 16)),
              trailing: DropdownButton<String>(
                value: fontNotifier.value,
                items: fonts
                    .map(
                      (f) => DropdownMenuItem<String>(value: f, child: Text(f)),
                    )
                    .toList(),
                onChanged: (newFont) {
                  fontNotifier.value = newFont!;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
