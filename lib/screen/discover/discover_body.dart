import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';

import 'discover_landing.dart';
import 'discover_movie_grid.dart';
import 'discover_spinner.dart';
import 'discover_store.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({super.key});

  @override
  State createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  final _scrollController = ScrollController();
  final _throttle = Throttle(
    duration: const Duration(milliseconds: 100),
  );

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _throttle.call(() {
        if (_scrollController.position.isBeyondRatio(0.8)) {
          context.read<DiscoverStore>().fetchMore();
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _throttle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: const [
        DiscoverLanding(),
        DiscoverMovieGrid(),
        DiscoverSpinner(),
      ],
    );
  }
}
