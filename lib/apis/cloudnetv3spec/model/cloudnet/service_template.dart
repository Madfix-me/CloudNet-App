import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_template.g.dart';

part 'service_template.freezed.dart';

@freezed
class ServiceTemplate with _$ServiceTemplate {
  const factory ServiceTemplate({
    @JsonKey(name: 'prefix') String? prefix,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'storage') String? storage,
    @JsonKey(name: 'alwaysCopyToStaticServices')
        bool? alwaysCopyToStaticServices,
  }) = _ServiceTemplate;

  factory ServiceTemplate.fromJson(Map<String, dynamic> json) =>
      _$ServiceTemplateFromJson(json);
}
