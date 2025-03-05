import 'package:flutter/material.dart';
import 'package:remember_demos/home_page.dart';
import 'package:remember_demos/text_styles.dart';
import 'package:remember_demos/theme.dart';

void main() {
  runApp(const MainApp());
}

final primaryFontNotifier = ValueNotifier<String>("Montserrat");
final secondaryFontNotifier = ValueNotifier<String>("Metropolis");
bool hasListener = false;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (!hasListener) {
      primaryFontNotifier.addListener(fontListener);
      secondaryFontNotifier.addListener(fontListener);
    }

    return ValueListenableBuilder<String>(
      valueListenable: secondaryFontNotifier,
      builder: (_, __, ___) {
        return ValueListenableBuilder<String>(
          valueListenable: primaryFontNotifier,
          builder: (_, __, ___) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getTheme(primaryFontNotifier.value),
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}
