import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool loading,
    required List<MoviePreview> popular,
    required List<MoviePreview> nowPlaying,
    required List<MoviePreview> upcoming,
  }) = _HomeState;
}

const initialHomeState = HomeState(
  loading: false,
  popular: [],
  nowPlaying: [],
  upcoming: [],
);
