import 'package:freezed_annotation/freezed_annotation.dart';

part 'lazy_list.freezed.dart';

@freezed
class LazyList<T> with _$LazyList<T> {
  const LazyList._();

  const factory LazyList({
    @Default([]) List<T> data,
    @Default(0) int total,
    @Default(1) int page,
    @Default(false) bool loading,
  }) = _LazyList<T>;

  bool get canFetchMore {
    return data.length < total && !loading;
  }
}
