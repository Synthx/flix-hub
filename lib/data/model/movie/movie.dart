import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

export 'movie_collection.dart';
export 'movie_keywords.dart';
export 'movie_preview.dart';
export 'movie_status.dart';
export 'movie_videos.dart';

part 'movie.freezed.dart';

part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String overview,
    required String homepage,
    required DateTime releaseDate,
    required int budget,
    required int revenue,
    required int runtime,
    required MovieStatus status,
    required List<Genre> genres,
    required String originalTitle,
    required String originalLanguage,
    required double voteAverage,
    required int voteCount,
    required MovieKeywords keywords,
    required MovieVideos videos,
    String? posterPath,
    String? backdropPath,
    String? tagline,
    MovieCollection? belongsToCollection,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
