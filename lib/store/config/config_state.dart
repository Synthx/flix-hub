import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_state.freezed.dart';

@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState({
    required List<String> backdropImageFormats,
    required List<String> posterImageFormats,
    String? baseImageUrl,
  }) = _ConfigState;
}

const initialConfigState = ConfigState(
  backdropImageFormats: [],
  posterImageFormats: [],
);
