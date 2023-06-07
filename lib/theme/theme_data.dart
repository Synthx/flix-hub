import 'package:flutter/material.dart';
import 'package:live_coding/theme/theme.dart';

ThemeData generateThemeData({
  required Brightness brightness,
  required Color primary,
  required Color background,
  required Color card,
  required Color text,
  required Color textSecondary,
}) {
  final defaultTextTheme = ThemeData.fallback().textTheme;

  return ThemeData(
    useMaterial3: true,
    primaryColor: primary,
    cardColor: card,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      background: background,
      brightness: brightness,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleSpacing: kSafeArea,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primary,
    ),
    textTheme: defaultTextTheme
        .copyWith(
          titleMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: text,
          ),
          titleSmall: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: text,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: textSecondary,
          ),
        )
        .apply(fontFamily: 'SF Pro Text'),
  );
}
