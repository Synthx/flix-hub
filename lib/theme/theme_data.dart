import 'package:flutter/material.dart';

ThemeData generateThemeData({
  required Brightness brightness,
  required Color primary,
  required Color background,
  required Color card,
  required Color text,
}) {
  final defaultTextTheme = ThemeData.fallback().textTheme;

  return ThemeData(
    useMaterial3: true,
    cardColor: card,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      background: background,
      brightness: brightness,
    ),
    textTheme: defaultTextTheme.copyWith().apply(
          fontFamily: '.SF Pro Text',
          bodyColor: text,
          displayColor: text,
        ),
  );
}
