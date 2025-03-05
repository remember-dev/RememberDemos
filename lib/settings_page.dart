import 'package:flutter/material.dart';
import 'package:remember_demos/main.dart';
import 'package:remember_demos/text_styles.dart';

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
              tileColor: Colors.white,
              title: Text("Primary Font", style: semiBoldPrimary),
              subtitle: Text(
                "Font for body, task titles, and large chunks of text",
                style: regularPrimary,
              ),
              trailing: DropdownButton<String>(
                value: primaryFontNotifier.value,
                items: fonts
                    .map(
                      (f) => DropdownMenuItem<String>(
                          value: f, child: Text(f, style: regularPrimary)),
                    )
                    .toList(),
                onChanged: (newFont) {
                  primaryFontNotifier.value = newFont!;
                },
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              tileColor: Colors.white,
              title: Text("Header Font", style: semiBoldSecondary),
              subtitle: Text(
                "Font for headers, things that pop out, and other things like that.",
                style: regularSecondary,
              ),
              trailing: DropdownButton<String>(
                value: secondaryFontNotifier.value,
                items: fonts
                    .map(
                      (f) => DropdownMenuItem<String>(
                          value: f, child: Text(f, style: regularSecondary)),
                    )
                    .toList(),
                onChanged: (newFont) {
                  setState(() {
                    secondaryFontNotifier.value = newFont!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
