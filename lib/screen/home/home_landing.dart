import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/screen/screen.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';
import 'package:remixicon/remixicon.dart';

import 'home_store.dart';

class HomeLanding extends StatelessWidget {
  const HomeLanding({super.key});

  Future _goToMovieDetail({
    required BuildContext context,
    required MoviePreview movie,
  }) async {
    context.pushNamed(
      MovieDetailScreen.name,
      extra: movie,
      pathParameters: {
        'id': movie.id.toString(),
      },
    );
  }

  Future _goToDiscoverPage({
    required BuildContext context,
  }) async {
    context.pushNamed(DiscoverScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeStore, HomeState, MoviePreview?>(
      selector: (state) => state.popular.firstOrNull,
      builder: (context, movie) {
        if (movie == null) {
          return const SliverAppBar();
        }

        return KitSliverLanding(
          path: movie.backdropPath,
          child: Padding(
            padding: EdgeInsets.only(
              top: kSafeArea + context.topSafeArea,
              bottom: 30,
              left: kSafeArea,
              right: kSafeArea,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  [
                    'Movie',
                    movie.genreIds.firstOrNull,
                    movie.releaseDate.year,
                  ].join(' · '),
                  textAlign: TextAlign.center,
                  style: context.textStyle.bodyMedium?.copyWith(
                    color: context.textStyle.titleMedium?.color,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KitButton.icon(
                      'Play',
                      icon: Remix.play_fill,
                      onTap: () {},
                    ),
                    const SizedBox(width: kSpacer),
                    KitButton.icon(
                      'More',
                      icon: Remix.add_fill,
                      variant: KitButtonVariant.secondary,
                      onTap: () => _goToMovieDetail(
                        context: context,
                        movie: movie,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                Row(
                  children: [
                    Text(
                      'Everything',
                      style: context.textStyle.titleLarge?.copyWith(),
                    ),
                    const Spacer(),
                    KitIconButton(
                      Remix.search_line,
                      onTap: () => _goToDiscoverPage(
                        context: context,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
