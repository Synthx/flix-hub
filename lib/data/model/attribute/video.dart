import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'video.freezed.dart';

part 'video.g.dart';

@freezed
class Video with _$Video {
  const factory Video({
    required String id,
    required String name,
    required String key,
    required bool official,
    required VideoType type,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
