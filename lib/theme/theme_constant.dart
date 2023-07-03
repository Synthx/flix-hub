import 'package:flutter/material.dart';

const kSpacer = 10.0;
const kSafeArea = 10.0;
const kBorderRadius = 30.0;

const kGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 3,
  childAspectRatio: 0.7,
  crossAxisSpacing: kSpacer,
  mainAxisSpacing: kSpacer,
);
