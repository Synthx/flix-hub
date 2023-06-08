import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/core/core.dart';
import 'package:live_coding/data/data.dart';

import 'movie_detail_additional_information.dart';
import 'movie_detail_app_bar.dart';
import 'movie_detail_information.dart';
import 'movie_detail_landing.dart';
import 'movie_detail_store.dart';
import 'movie_detail_trailers.dart';

class MovieDetailScreen extends StatelessWidget {
  static String name = 'movie_detail';

  final int id;
  final MoviePreview? preview;

  const MovieDetailScreen({
    required this.id,
    this.preview,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailStore(
        movieService: getIt(),
      )..init(id: id, preview: preview),
      child: const Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MovieDetailAppBar(),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            MovieDetailLanding(),
            MovieDetailInformation(),
            MovieDetailTrailers(),
            MovieDetailAdditionalInformation(),
          ],
        ),
      ),
    );
  }
}
