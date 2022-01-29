import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_deployment.freezed.dart';

part 'service_deployment.g.dart';

@freezed
class ServiceDeployment with _$ServiceDeployment {
  const factory ServiceDeployment({
    @JsonKey(name: 'properties') @Default(<String, dynamic>{}) Map<String, dynamic> properties,
    @JsonKey(name: 'template') ServiceTemplate? template,
    @JsonKey(name: 'excludes') @Default(<String>[]) List<String> excludes,
  }) = _ServiceDeployment;

  factory ServiceDeployment.fromJson(Map<String, dynamic> json) =>
      _$ServiceDeploymentFromJson(json);
}
