import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_collection.freezed.dart';

part 'movie_collection.g.dart';

@freezed
class MovieCollection with _$MovieCollection {
  const factory MovieCollection({
    required int id,
    required String name,
    required String posterPath,
    required String backdropPath,
  }) = _MovieCollection;

  factory MovieCollection.fromJson(Map<String, dynamic> json) =>
      _$MovieCollectionFromJson(json);
}
