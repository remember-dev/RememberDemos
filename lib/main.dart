import 'package:flutter/material.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/theme.dart';

void main() {
  runApp(const MainApp());
}

final fontNotifier = ValueNotifier<String>("Montserrat");

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: fontNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getTheme(fontNotifier.value),
          home: HomePage(),
        );
      },
    );
  }
}
