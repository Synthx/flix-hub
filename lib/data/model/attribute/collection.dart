import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'collection.freezed.dart';

part 'collection.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required int id,
    required String name,
    required String overview,
    required String posterPath,
    required String backdropPath,
    required List<MoviePreview> parts,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}
