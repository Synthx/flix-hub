import 'package:flutter/material.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/widget/widget.dart';

class KitMovieCard extends StatelessWidget {
  final MoviePreview movie;
  final ValueSetter<MoviePreview>? onTap;

  const KitMovieCard({
    required this.movie,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(movie),
      child: KitPicture(
        movie.posterPath,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
