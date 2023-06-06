import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/extension/extension.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/widget/widget.dart';
import 'package:remixicon/remixicon.dart';

import 'home_store.dart';

class HomeLanding extends StatelessWidget {
  const HomeLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeStore, HomeState, MoviePreview?>(
      selector: (state) => state.popular.firstOrNull,
      builder: (context, movie) {
        if (movie == null) {
          return const SliverAppBar();
        }

        return SliverAppBar(
          expandedHeight: 450,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w1920_and_h800_multi_faces/h8gHn0OzBoaefsYseUByqsmEDMY.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            child: Column(
              children: [
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(),
                ),
                Wrap(
                  children: [
                    Text('${movie.releaseDate.year}'),
                    Text('${movie.genreIds.firstOrNull}'),
                  ],
                ),
                Row(
                  children: [
                    const KitIconButton(
                      icon: Remix.add_line,
                    ),
                    KitButton.text('More'),
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
