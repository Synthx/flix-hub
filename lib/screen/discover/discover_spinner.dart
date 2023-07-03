import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/theme/theme.dart';

import 'discover_store.dart';

class DiscoverSpinner extends StatelessWidget {
  const DiscoverSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: kSafeArea,
          right: kSafeArea,
          bottom: kSafeArea + context.bottomSafeArea,
        ),
        child: BlocSelector<DiscoverStore, DiscoverState, bool>(
          selector: (state) => state.movies.loading,
          builder: (context, loading) {
            if (loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
