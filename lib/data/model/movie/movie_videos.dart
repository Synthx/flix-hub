import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'movie_videos.freezed.dart';

part 'movie_videos.g.dart';

@freezed
class MovieVideos with _$MovieVideos {
  const factory MovieVideos({
    required List<Video> results,
  }) = _MovieVideos;

  factory MovieVideos.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosFromJson(json);
}
