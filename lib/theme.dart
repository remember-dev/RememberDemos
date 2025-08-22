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
    cardTheme: const CardThemeData(
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
      style: RememberButtonStyles.primary,
    ),
  );
}

class RememberButtonStyles {
  static final ButtonStyle _common = ButtonStyle(
    backgroundColor: WidgetStateProperty.all(Colors.white),
    shape: WidgetStateProperty.resolveWith((state) {
      bool isDisabled = state.contains(WidgetState.disabled);
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
        side: BorderSide(color: Colors.black, width: isDisabled ? 0.5 : 1),
      );
    }),
  );

  static final ButtonStyle primary = _common;

  static final ButtonStyle secondary = _common.copyWith(
    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(999),
    )),
  );
}
