import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';

import 'movie_detail_store.dart';

class MovieDetailInformation extends StatelessWidget {
  const MovieDetailInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocSelector<MovieDetailStore, MovieDetailState, MoviePreview?>(
        selector: (store) => store.preview,
        builder: (context, preview) {
          if (preview == null) {
            return Container();
          }

          return Padding(
            padding: const EdgeInsets.only(
              left: kSafeArea,
              right: kSafeArea,
              bottom: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  BlocSelector<MovieDetailStore, MovieDetailState, Movie?>(
                    selector: (store) => store.movie,
                    builder: (context, movie) {
                      if (movie == null ||
                          movie.tagline == null ||
                          movie.tagline!.isEmpty) {
                        return Container();
                      }

                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: kSpacer,
                        ),
                        child: Text(
                          movie.tagline!,
                          textAlign: TextAlign.center,
                          style: context.textStyle.titleSmall?.copyWith(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            color: context.textStyle.bodyMedium?.color,
                          ),
                        ),
                      );
                    },
                  ),
                  Text(
                    [
                      preview.genreIds.firstOrNull,
                      preview.releaseDate.toLocale(format: 'yMMMMd'),
                    ].join(' • '),
                    style: context.textStyle.bodyMedium?.copyWith(
                      color: context.textStyle.titleMedium?.color,
                    ),
                  ),
                  const SizedBox(height: kSpacer),
                  Text(
                    preview.overview,
                    style: context.textStyle.bodyMedium?.copyWith(),
                  ),
                  const SizedBox(height: kSpacer),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
