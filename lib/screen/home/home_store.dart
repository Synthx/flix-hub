import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/data/data.dart';

import 'home_state.dart';

export 'home_state.dart';

class HomeStore extends Cubit<HomeState> {
  final MovieService movieService;

  HomeStore({
    required this.movieService,
  }) : super(initialHomeState);

  Future init() async {
    emit(state.copyWith(loading: true));
    final [popular, upcoming, nowPlaying] = await Future.wait([
      movieService.findPopular(),
      movieService.findUpcoming(),
      movieService.findNowPlaying(),
    ]);
    emit(state.copyWith(
      popular: popular,
      upcoming: upcoming,
      nowPlaying: nowPlaying,
      loading: false,
    ));
  }
}
