import 'package:flutter/material.dart';
import 'package:live_coding/data/data.dart';

class MovieDetailScreen extends StatelessWidget {
  final MoviePreview? preview;

  const MovieDetailScreen({
    this.preview,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Placeholder(),
    );
  }
}
