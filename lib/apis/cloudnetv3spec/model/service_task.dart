import 'package:CloudNet/apis/cloudnetv3spec/model/process_configuration.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_deployment.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_remote_inclusion.dart';
import 'package:CloudNet/apis/cloudnetv3spec/model/service_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_task.g.dart';

part 'service_task.freezed.dart';

@freezed
class ServiceTask with _$ServiceTask {
  const factory ServiceTask({
    @JsonKey(name: 'properties') Map<String, dynamic>? properties,
    @JsonKey(name: 'includes') List<ServiceRemoteInclusion>? includes,
    @JsonKey(name: 'templates') List<ServiceTemplate>? templates,
    @JsonKey(name: 'deployments') List<ServiceDeployment>? deployments,
    @JsonKey(name: 'processConfiguration') ProcessConfiguration? processConfiguration,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'minServiceCount') int? minServiceCount,
    @JsonKey(name: 'startPort') int? startPort,
    @JsonKey(name: 'runtime') String? runtime,
    @JsonKey(name: 'javaCommand') String? javaCommand,
    @JsonKey(name: 'disableIpRewrite') bool? disableIpRewrite,
    @JsonKey(name: 'maintenance') bool? maintenance,
    @JsonKey(name: 'autoDeleteOnStop') bool? autoDeleteOnStop,
    @JsonKey(name: 'staticServices') bool? staticServices,
    @JsonKey(name: 'associatedNodes') List<String>? associatedNodes,
    @JsonKey(name: 'groups') List<String>? groups,
    @JsonKey(name: 'deletedFilesAfterStop') List<String>? deletedFilesAfterStop,
  }) = _ServiceTask;

  factory ServiceTask.fromJson(Map<String, dynamic> json) =>
      _$ServiceTaskFromJson(json);
}
