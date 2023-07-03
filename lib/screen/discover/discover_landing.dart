import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';
import 'package:live_coding/theme/theme.dart';
import 'package:live_coding/widget/widget.dart';
import 'package:remixicon/remixicon.dart';

import 'discover_sort_by.dart';
import 'discover_store.dart';

class DiscoverLanding extends StatelessWidget {
  const DiscoverLanding({super.key});

  Future _openSortByBottomSheet({
    required BuildContext context,
  }) async {
    final store = context.read<DiscoverStore>();
    final option = await showModalBottomSheet<SortBy>(
      context: context,
      builder: (context) => DiscoverSortByBottomSheet(
        sortBy: store.state.sortBy,
      ),
    );

    if (option != null) {
      store.setSortBy(option);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: kSafeArea,
          right: kSafeArea,
          top: 50 + context.topSafeArea,
          bottom: 50,
        ),
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover',
                    style: context.textStyle.titleLarge?.copyWith(),
                  ),
                  BlocSelector<DiscoverStore, DiscoverState, int>(
                    selector: (state) => state.movies.total,
                    builder: (context, total) {
                      return Text(
                        '$total Movies · Find your next favorite movie',
                        style: context.textStyle.bodyMedium?.copyWith(),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: kSpacer),
            KitIconButton(
              Remix.filter_3_fill,
              onTap: () => _openSortByBottomSheet(
                context: context,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
