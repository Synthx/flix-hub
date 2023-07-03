import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'discover_state.freezed.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState({
    required LazyList<MoviePreview> movies,
    required SortBy sortBy,
  }) = _DiscoverState;
}

const initialDiscoverState = DiscoverState(
  movies: LazyList(),
  sortBy: SortBy.popularity,
);
