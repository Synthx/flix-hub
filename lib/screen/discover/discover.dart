import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';

import 'discover_app_bar.dart';
import 'discover_body.dart';
import 'discover_store.dart';

class DiscoverScreen extends StatelessWidget {
  static String name = 'discover';

  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverStore(
        movieService: getIt(),
      )..init(),
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: DiscoverAppBar(),
        body: DiscoverBody(),
      ),
    );
  }
}
