import 'dart:async';

import 'package:flutter/material.dart';

class Throttle {
  final Duration duration;
  Timer? _timer;

  Throttle({
    required this.duration,
  });

  void call(VoidCallback action) {
    if (_timer?.isActive == true) {
      return;
    }

    _timer?.cancel();
    action();
    _timer = Timer(duration, () {});
  }

  void dispose() {
    _timer?.cancel();
  }
}
