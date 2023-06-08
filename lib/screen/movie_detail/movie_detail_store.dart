import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_coding/data/data.dart';

import 'movie_detail_state.dart';

export 'movie_detail_state.dart';

class MovieDetailStore extends Cubit<MovieDetailState> {
  final MovieService movieService;

  MovieDetailStore({
    required this.movieService,
  }) : super(const MovieDetailState(
          loading: false,
        ));

  Future init({
    required int id,
    MoviePreview? preview,
  }) async {
    emit(state.copyWith(
      loading: true,
      preview: preview,
    ));
    final movie = await movieService.findById(id);
    emit(state.copyWith(
      loading: false,
      movie: movie,
      preview: MoviePreview(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        posterPath: movie.posterPath,
        backdropPath: movie.backdropPath,
        releaseDate: movie.releaseDate,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
        genreIds: movie.genres.map((e) => e.id).toList(),
      ),
    ));
  }
}
