import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  TextTheme get textStyle => Theme.of(this).textTheme;

  double get topSafeArea => MediaQuery.of(this).padding.top;
}
