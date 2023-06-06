import 'package:freezed_annotation/freezed_annotation.dart';

part 'range.freezed.dart';

@freezed
class Range<T> with _$Range<T> {
  const factory Range({
    T? min,
    T? max,
  }) = _Range;
}
