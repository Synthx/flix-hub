import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_preview.freezed.dart';

part 'movie_preview.g.dart';

@freezed
class MoviePreview with _$MoviePreview {
  const factory MoviePreview({
    required int id,
    required String title,
    required String overview,
    required DateTime releaseDate,
    required List<int> genreIds,
    required String posterPath,
    String? backdropPath,
  }) = _MoviePreview;

  factory MoviePreview.fromJson(Map<String, dynamic> json) =>
      _$MoviePreviewFromJson(json);
}
