import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';

import 'home_app_bar.dart';
import 'home_landing.dart';
import 'home_now_playing.dart';
import 'home_popular.dart';
import 'home_store.dart';
import 'home_upcoming.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeStore(
        movieService: getIt(),
      )..init(),
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: HomeAppBar(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            HomeLanding(),
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              sliver: HomeNowPlaying(),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              sliver: HomePopular(),
            ),
            SliverSafeArea(
              top: false,
              bottom: true,
              sliver: SliverPadding(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                sliver: HomeUpcoming(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
