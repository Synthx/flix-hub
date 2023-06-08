import 'package:freezed_annotation/freezed_annotation.dart';

part 'language.freezed.dart';

part 'language.g.dart';

@freezed
class Language with _$Language {
  const factory Language({
    @JsonKey(name: 'iso_639_1') required String iso6391,
    required String name,
    required String englishName,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}
