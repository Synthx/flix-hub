import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'movie_keywords.freezed.dart';

part 'movie_keywords.g.dart';

@freezed
class MovieKeywords with _$MovieKeywords {
  const factory MovieKeywords({
    required List<Keyword> keywords,
  }) = _MovieKeywords;

  factory MovieKeywords.fromJson(Map<String, dynamic> json) =>
      _$MovieKeywordsFromJson(json);
}
