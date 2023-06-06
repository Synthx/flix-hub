import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:live_coding/data/data.dart';

part 'config_details.freezed.dart';

part 'config_details.g.dart';

@freezed
class ConfigDetails with _$ConfigDetails {
  const factory ConfigDetails({
    required ConfigDetailsImages images,
  }) = _ConfigDetails;

  factory ConfigDetails.fromJson(Map<String, dynamic> json) =>
      _$ConfigDetailsFromJson(json);
}
