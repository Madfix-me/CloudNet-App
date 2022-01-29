import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_deployment.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_remote_inclusion.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_configuration.g.dart';

part 'group_configuration.freezed.dart';

@freezed
class GroupConfiguration with _$GroupConfiguration {
  const factory GroupConfiguration({
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'includes')
    @Default(<ServiceRemoteInclusion>[])
        List<ServiceRemoteInclusion> includes,
    @JsonKey(name: 'templates')
    @Default(<ServiceTemplate>[])
        List<ServiceTemplate> templates,
    @JsonKey(name: 'deployments')
    @Default(<ServiceDeployment>[])
        List<ServiceDeployment> deployments,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'jvmOptions') @Default(<String>[]) List<String> jvmOptions,
    @JsonKey(name: 'processParameters')
    @Default(<String>[])
        List<String> processParameters,
    @JsonKey(name: 'targetEnvironments')
    @Default(<String>[])
        List<String> targetEnvironments,
  }) = _GroupConfiguration;

  factory GroupConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GroupConfigurationFromJson(json);
}
