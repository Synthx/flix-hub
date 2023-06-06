import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_details_images.freezed.dart';

part 'config_details_images.g.dart';

@freezed
class ConfigDetailsImages with _$ConfigDetailsImages {
  const factory ConfigDetailsImages({
    required String baseUrl,
    required String secureBaseUrl,
    required List<String> backdropSizes,
    required List<String> posterSizes,
    required List<String> profileSizes,
  }) = _ConfigDetailsImages;

  factory ConfigDetailsImages.fromJson(Map<String, dynamic> json) =>
      _$ConfigDetailsImagesFromJson(json);
}
