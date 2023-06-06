import 'package:flutter/material.dart';
import 'package:live_coding/app.dart';
import 'package:live_coding/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjector();
  setupHttpClient();

  runApp(const LiveCoding());
}
