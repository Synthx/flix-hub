import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';

import 'movie_detail_store.dart';

class MovieDetailTrailers extends StatelessWidget {
  const MovieDetailTrailers({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocSelector<MovieDetailStore, MovieDetailState, List<Video>>(
        selector: (store) => store.movie?.videos.results ?? [],
        builder: (context, videos) {
          if (videos.isEmpty) {
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
              padding: const EdgeInsets.symmetric(
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Text(
                      'Medias',
                      style: context.textStyle.titleSmall?.copyWith(),
                    ),
                  ),
                  const SizedBox(height: kSpacer),
                  SizedBox(
                    height: 190,
                    child: ListView.separated(
                      itemCount: videos.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: kSpacer,
                      ),
                      itemBuilder: (context, index) => SizedBox(
                        width: 290,
                        child: KitVideoCard(
                          video: videos[index],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
