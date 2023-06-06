import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textStyle => Theme.of(this).textTheme;
}
