import 'package:CloudNet/apis/cloudnetv3spec/model/service_version.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_version_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_install.g.dart';

part 'template_install.freezed.dart';

@freezed
class TemplateInstall with _$TemplateInstall {

  const factory TemplateInstall({
    @JsonKey(name: 'force') @Default(false) bool force,
    @JsonKey(name: 'type') ServiceVersionType? serviceVersionType,
    @JsonKey(name: 'version') ServiceVersion? serviceVersion,
}) = _TemplateInstall;


  factory TemplateInstall.fromJson(Map<String, dynamic> json) =>
      _$TemplateInstallFromJson(json);
}
