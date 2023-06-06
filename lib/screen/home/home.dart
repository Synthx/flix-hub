import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';

import 'home_app_bar.dart';
import 'home_landing.dart';
import 'home_popular.dart';
import 'home_store.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStore(
        movieService: getIt(),
      )..init(),
      child: const Scaffold(
        body: CustomScrollView(
          slivers: [
            HomeAppBar(),
            HomeLanding(),
            HomePopular(),
          ],
        ),
      ),
    );
  }
}
