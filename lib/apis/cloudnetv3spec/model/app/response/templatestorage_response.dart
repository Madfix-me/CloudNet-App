import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'templatestorage_response.freezed.dart';

part 'templatestorage_response.g.dart';

@freezed
class TemplateStorageResponse with _$TemplateStorageResponse {
  const factory TemplateStorageResponse({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'reason') String? reason,
    @JsonKey(name: 'templates')
    @Default(<ServiceTemplate>[])
        List<ServiceTemplate> templates,
  }) = _TemplateStorageResponse;

  factory TemplateStorageResponse.fromJson(Map<String, dynamic> json) =>
      _$TemplateStorageResponseFromJson(json);
}
