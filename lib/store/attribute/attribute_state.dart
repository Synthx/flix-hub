import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'attribute_state.freezed.dart';

@freezed
class AttributeState with _$AttributeState {
  const factory AttributeState({
    required List<Genre> genres,
  }) = _AttributeState;
}

const initialAttributeState = AttributeState(
  genres: [],
);
