import 'package:freezed_annotation/freezed_annotation.dart';

enum VideoType {
  @JsonValue('Teaser')
  teaser,
  @JsonValue('Trailer')
  trailer,
  @JsonValue('Clip')
  clip,
  @JsonValue('Featurette')
  featurette,
  @JsonValue('Behind the Scenes')
  behindTheScenes,
}
