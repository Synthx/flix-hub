import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';
import 'package:remixicon/remixicon.dart';

import 'movie_detail_store.dart';

class MovieDetailLanding extends StatelessWidget {
  const MovieDetailLanding({super.key});

  Future _shareMovie({
    required MoviePreview preview,
  }) async {
    // todo: fix NSOSStatusErrorDomain code=-54
    /**
        await Share.share(
        'Check this out',
        subject: preview.title,
        );
     **/
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieDetailStore, MovieDetailState, MoviePreview?>(
      selector: (store) => store.preview,
      builder: (context, preview) {
        if (preview == null) {
          return const SliverAppBar();
        }

        return KitSliverLanding(
          path: preview.posterPath,
          child: Padding(
            padding: EdgeInsets.only(
              top: kSafeArea + context.topSafeArea,
              bottom: 20,
              left: kSafeArea,
              right: kSafeArea,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    preview.title,
                    textAlign: TextAlign.center,
                    style: context.textStyle.titleLarge?.copyWith(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      KitButton.icon(
                        'Play',
                        icon: Remix.play_fill,
                        reversed: true,
                        onTap: () {},
                      ),
                      const SizedBox(width: kSpacer),
                      KitIconButton(
                        Remix.add_line,
                        onTap: () {},
                      ),
                      const Spacer(),
                      KitIconButton(
                        Remix.share_line,
                        onTap: () => _shareMovie(
                          preview: preview,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
