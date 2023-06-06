import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';

import 'home_store.dart';

class HomePopular extends StatelessWidget {
  const HomePopular({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended for you',
            style: context.textStyle.titleSmall?.copyWith(),
          ),
          const SizedBox(height: kSpacer),
          SizedBox(
            height: 160,
            child: BlocSelector<HomeStore, HomeState, List<MoviePreview>>(
              selector: (state) => state.popular,
              builder: (context, popular) {
                return ListView.separated(
                  itemCount: popular.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: kSpacer,
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 110,
                      child: KitMovieCard(
                        movie: popular[index],
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
