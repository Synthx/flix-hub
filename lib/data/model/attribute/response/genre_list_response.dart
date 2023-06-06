import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'genre_list_response.freezed.dart';

part 'genre_list_response.g.dart';

@freezed
class GenreListResponse with _$GenreListResponse {
  const factory GenreListResponse({
    required List<Genre> genres,
  }) = _GenreListResponse;

  factory GenreListResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreListResponseFromJson(json);
}
