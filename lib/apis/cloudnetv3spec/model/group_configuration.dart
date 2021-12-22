import 'package:CloudNet/apis/cloudnetv3spec/model/service_deployment.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_remote_inclusion.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_configuration.g.dart';

part 'group_configuration.freezed.dart';

@freezed
class GroupConfiguration with _$GroupConfiguration {
  const factory GroupConfiguration({
    @JsonKey(name: 'properties') Map<String, dynamic>? properties,
    @JsonKey(name: 'includes') List<ServiceRemoteInclusion>? includes,
    @JsonKey(name: 'templates') List<ServiceTemplate>? templates,
    @JsonKey(name: 'deployments') List<ServiceDeployment>? deployments,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'jvmOptions') List<String>? jvmOptions,
    @JsonKey(name: 'processParameters') List<String>? processParameters,
    @JsonKey(name: 'targetEnvironments') List<String>? targetEnvironments,
  }) = _GroupConfiguration;

  factory GroupConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GroupConfigurationFromJson(json);
}
