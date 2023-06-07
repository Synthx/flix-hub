import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';
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

        final height = 480 + context.topSafeArea;
        return SliverAppBar(
          collapsedHeight: height,
          expandedHeight: height,
          snap: false,
          pinned: false,
          floating: false,
          stretch: true,
          flexibleSpace: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ).createShader(Rect.fromLTRB(
                  0,
                  -140,
                  rect.width,
                  rect.height - 20,
                )),
                blendMode: BlendMode.darken,
                child: KitPicture(
                  movie.posterPath,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: kSafeArea + context.topSafeArea,
                  bottom: 50,
                  left: kSafeArea,
                  right: kSafeArea,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Movie · ${movie.genreIds.firstOrNull} · ${movie.releaseDate.year}',
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
                          reversed: true,
                          onTap: () {},
                        ),
                        const SizedBox(width: kSpacer),
                        KitButton.icon(
                          'More',
                          icon: Remix.add_fill,
                          variant: KitButtonVariant.secondary,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
