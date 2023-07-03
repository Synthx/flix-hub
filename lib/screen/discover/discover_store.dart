import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/data/data.dart';

import 'discover_state.dart';

export 'discover_state.dart';

class DiscoverStore extends Cubit<DiscoverState> {
  final MovieService movieService;

  DiscoverStore({
    required this.movieService,
  }) : super(initialDiscoverState);

  Future init() async {
    emit(state.copyWith.movies(loading: true));
    final page = await movieService.findAll(
      sortBy: state.sortBy,
      page: 1,
    );
    emit(state.copyWith.movies(
      data: page.results,
      total: page.totalResults,
      page: 1,
      loading: false,
    ));
  }

  Future fetchMore() async {
    if (!state.movies.canFetchMore) {
      return;
    }

    emit(state.copyWith.movies(loading: true));
    final page = await movieService.findAll(
      sortBy: state.sortBy,
      page: state.movies.page + 1,
    );
    emit(state.copyWith.movies(
      data: [...state.movies.data, ...page.results],
      page: state.movies.page + 1,
      loading: false,
    ));
  }

  Future setSortBy(SortBy sortBy) async {
    if (state.sortBy == sortBy) {
      return;
    }

    emit(state.copyWith(
      sortBy: sortBy,
      movies: state.movies.copyWith(
        loading: true,
        data: [],
        total: 0,
        page: 1,
      ),
    ));
    final page = await movieService.findAll(
      sortBy: sortBy,
      page: 1,
    );
    emit(state.copyWith.movies(
      data: page.results,
      total: page.totalResults,
      loading: false,
    ));
  }
}
