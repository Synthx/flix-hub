import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';

part 'page.g.dart';

@Freezed(genericArgumentFactories: true)
class Page<T> with _$Page<T> {
  const factory Page({
    required int page,
    required int totalPages,
    required int totalResults,
    required List<T> results,
  }) = _Page;

  factory Page.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PageFromJson(json, fromJsonT);
}
