import 'package:flutter/material.dart';

extension ScrollPositionExtension on ScrollPosition {
  bool isBeyondRatio(double ratio) {
    assert(ratio >= 0 && ratio <= 1);

    return pixels > maxScrollExtent * ratio;
  }
}
