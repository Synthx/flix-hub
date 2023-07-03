import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/screen/screen.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';

import 'discover_store.dart';

class DiscoverMovieGrid extends StatelessWidget {
  const DiscoverMovieGrid({super.key});

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

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSafeArea,
      ),
      sliver: BlocSelector<DiscoverStore, DiscoverState, List<MoviePreview>>(
        selector: (state) => state.movies.data,
        builder: (context, movies) {
          return SliverGrid(
            gridDelegate: kGridDelegate,
            delegate: SliverChildBuilderDelegate(
              childCount: movies.length,
              (context, index) => KitMovieCard(
                movie: movies[index],
                onTap: (movie) => _goToMovieDetail(
                  context: context,
                  movie: movie,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
