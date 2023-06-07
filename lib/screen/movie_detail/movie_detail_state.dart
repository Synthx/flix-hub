import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'movie_detail_state.freezed.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    required bool loading,
    MoviePreview? preview,
    Movie? movie,
  }) = _MovieDetailState;
}

const initialMovieDetailState = MovieDetailState(
  loading: false,
);
