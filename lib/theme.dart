import 'package:flutter/material.dart';

class RememberColors {
  static const Color white = Colors.white;
  static const Color xLight = Color(0xFFF4F4F4);
  static const Color light = Color(0xFFE9E9E9);
  static const Color regular = Color(0xFFDADADA);
  static const Color gray = Color(0xFF8D8D92);
  static const Color mid = Color(0xFF646464);
  static const Color dark = Color(0xFF404040);
  static const Color xDark = Color(0xFF323232);
  static const Color xxDark = Color(0xFF242426);
  static const Color black = Colors.black;

  static const Color lightBlue = Color(0xFF007AFF);
}

ThemeData getTheme(String font) {
  return ThemeData(
    fontFamily: font,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF202020),
      onPrimary: Color(0xFFBBBBBB),
      secondary: Color(0xFFBBBBBB),
      onSecondary: RememberColors.light,
      error: Color(0xFFF32424),
      onError: Color(0xFFF32424),
      shadow: Colors.transparent,
      surface: RememberColors.light,
      onSurface: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: RememberColors.light,
    ),
    cardTheme: const CardTheme(
      color: RememberColors.light,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: RememberColors.white,
      surfaceTintColor: RememberColors.light,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide.none,
      ),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      splashRadius: 1.0,
      visualDensity: VisualDensity.standard,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: RememberColors.white,
      shape: RoundedRectangleBorder(),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: Colors.white,
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      labelTextStyle: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return const TextStyle(color: Colors.black);
        }
        return const TextStyle(color: Colors.white);
      }),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        surfaceTintColor: WidgetStateProperty.all<Color>(Colors.white),
        elevation: WidgetStateProperty.all<double>(10.0),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300.0),
            side: const BorderSide(color: Colors.black, width: 3.0),
          ),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
            TextStyle(fontWeight: FontWeight.bold)),
      ),
    ),
  );
}

final ButtonStyle primaryStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
  surfaceTintColor: WidgetStateProperty.all<Color>(Colors.white),
  elevation: WidgetStateProperty.all<double>(10.0),
  shadowColor: WidgetStateProperty.all<Color>(Colors.black),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(300.0),
      side: const BorderSide(color: Colors.black, width: 3.0),
    ),
  ),
  textStyle: WidgetStateProperty.all<TextStyle>(
      TextStyle(fontWeight: FontWeight.bold)),
  padding: WidgetStateProperty.all<EdgeInsets>(
    const EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 14),
  ),
);

final ButtonStyle secondaryStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
  surfaceTintColor: WidgetStateProperty.all<Color>(Colors.white),
  elevation: WidgetStateProperty.all<double>(10.0),
  shadowColor: WidgetStateProperty.all<Color>(Colors.black),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(300.0))),
  textStyle: WidgetStateProperty.all<TextStyle>(
      TextStyle(fontWeight: FontWeight.w500)),
  padding: WidgetStateProperty.all<EdgeInsets>(
    const EdgeInsets.only(left: 18, right: 18, top: 14, bottom: 14),
  ),
);
