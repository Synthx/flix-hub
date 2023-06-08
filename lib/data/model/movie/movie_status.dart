import 'package:freezed_annotation/freezed_annotation.dart';

enum MovieStatus {
  @JsonValue('Released')
  released,
  @JsonValue('Post Production')
  postProduction,
}
