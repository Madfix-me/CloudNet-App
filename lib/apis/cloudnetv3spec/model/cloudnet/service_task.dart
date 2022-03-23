import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/process_configuration.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_deployment.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_remote_inclusion.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_task.freezed.dart';
part 'service_task.g.dart';

@freezed
class ServiceTask with _$ServiceTask {
  const factory ServiceTask({
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
    @JsonKey(name: 'processConfiguration')
        ProcessConfiguration? processConfiguration,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'nameSplitter') String? nameSplitter,
    @JsonKey(name: 'minServiceCount') int? minServiceCount,
    @JsonKey(name: 'startPort') int? startPort,
    @JsonKey(name: 'runtime') @Default('jvm') String runtime,
    @JsonKey(name: 'javaCommand') @Default('java') String javaCommand,
    @JsonKey(name: 'disableIpRewrite') @Default(false) bool disableIpRewrite,
    @JsonKey(name: 'maintenance') @Default(false) bool maintenance,
    @JsonKey(name: 'autoDeleteOnStop') @Default(true) bool autoDeleteOnStop,
    @JsonKey(name: 'staticServices') @Default(false) bool staticServices,
    @JsonKey(name: 'associatedNodes')
    @Default(<String>[])
        List<String> associatedNodes,
    @JsonKey(name: 'groups') @Default(<String>[]) List<String>? groups,
    @JsonKey(name: 'deletedFilesAfterStop')
    @Default(<String>[])
        List<String>? deletedFilesAfterStop,
  }) = _ServiceTask;

  factory ServiceTask.fromJson(Map<String, dynamic> json) =>
      _$ServiceTaskFromJson(json);
}
