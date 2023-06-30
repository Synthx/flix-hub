import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';

import 'movie_detail_store.dart';

class MovieDetailAdditionalInformation extends StatelessWidget {
  const MovieDetailAdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocSelector<MovieDetailStore, MovieDetailState, Movie?>(
        selector: (store) => store.movie,
        builder: (context, movie) {
          if (movie == null) {
            return Container();
          }

          final keywords = movie.keywords.keywords;
          return Padding(
            padding: EdgeInsets.only(
              left: kSafeArea,
              right: kSafeArea,
              bottom: kSafeArea + context.bottomSafeArea,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Additional Information',
                    style: context.textStyle.titleSmall?.copyWith(),
                  ),
                  const SizedBox(height: kSpacer),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInformation(
                              context: context,
                              title: 'Duration',
                              value: movie.runtime.toDuration(),
                            ),
                            const SizedBox(height: kSpacer),
                            _buildInformation(
                              context: context,
                              title: 'Status',
                              value: context.t.movieStatus(movie.status.name),
                            ),
                            const SizedBox(height: kSpacer),
                            _buildInformation(
                              context: context,
                              title: 'Original Language',
                              value: movie.originalLanguage,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: kSpacer),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInformation(
                              context: context,
                              title: 'Budget',
                              value: movie.budget.toCurrency(),
                            ),
                            const SizedBox(height: kSpacer),
                            _buildInformation(
                              context: context,
                              title: 'Revenue',
                              value: movie.revenue.toCurrency(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: kSpacer),
                  Text(
                    'Keywords',
                    style: context.textStyle.bodyMedium?.copyWith(),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: keywords
                        .map(
                          (e) => KitChip.text(e.name),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInformation({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textStyle.bodyMedium?.copyWith(),
        ),
        Text(
          value,
          style: context.textStyle.bodyMedium?.copyWith(
            color: context.textStyle.titleMedium?.color,
          ),
        ),
      ],
    );
  }
}
