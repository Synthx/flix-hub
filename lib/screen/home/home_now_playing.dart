import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/screen/screen.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';

import 'home_store.dart';

class HomeNowPlaying extends StatelessWidget {
  const HomeNowPlaying({super.key});

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
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kSafeArea,
            ),
            child: Text(
              'Now Playing',
              style: context.textStyle.titleSmall?.copyWith(),
            ),
          ),
          const SizedBox(height: kSpacer),
          SizedBox(
            height: 160,
            child: BlocSelector<HomeStore, HomeState, List<MoviePreview>>(
              selector: (state) => state.nowPlaying,
              builder: (context, popular) {
                return ListView.separated(
                  itemCount: popular.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: kSafeArea,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: kSpacer,
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 110,
                      child: KitMovieCard(
                        movie: popular[index],
                        onTap: (movie) => _goToMovieDetail(
                          context: context,
                          movie: movie,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
