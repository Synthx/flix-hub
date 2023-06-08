import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';

import 'movie_detail_store.dart';

class MovieDetailCollection extends StatelessWidget {
  const MovieDetailCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocSelector<MovieDetailStore, MovieDetailState, MovieCollection?>(
        selector: (store) => store.movie?.belongsToCollection,
        builder: (context, collection) {
          if (collection == null) {
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
              child: Container(),
            ),
          );
        },
      ),
    );
  }
}
