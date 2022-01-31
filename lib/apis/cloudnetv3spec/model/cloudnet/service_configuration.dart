import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/process_configuration.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_deployment.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_id.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_remote_inclusion.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_template.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_configuration.freezed.dart';
part 'service_configuration.g.dart';

@freezed
class ServiceConfiguration with _$ServiceConfiguration {
  const factory ServiceConfiguration({
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'serviceId') ServiceId? serviceId,
    @JsonKey(name: 'runtime') String? runtime,
    @JsonKey(name: 'javaCommand') String? javaCommand,
    @JsonKey(name: 'port') int? port,
    @JsonKey(name: 'autoDeleteOnStop') @Default(true) bool autoDeleteOnStop,
    @JsonKey(name: 'staticService') @Default(false) bool staticService,
    @JsonKey(name: 'groups') @Default(<String>[]) List<String> groups,
    @JsonKey(name: 'processConfig') ProcessConfiguration? processConfig,
    @JsonKey(name: 'deletedFilesAfterStop')
    @Default(<String>[])
        List<String> deletedFilesAfterStop,
    @JsonKey(name: 'templates')
    @Default(<ServiceTemplate>[])
        List<ServiceTemplate> templates,
    @JsonKey(name: 'deployments')
    @Default(<ServiceDeployment>[])
        List<ServiceDeployment> deployments,
    @JsonKey(name: 'includes')
    @Default(<ServiceRemoteInclusion>[])
        List<ServiceRemoteInclusion> includes,
  }) = _ServiceConfiguration;

  factory ServiceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ServiceConfigurationFromJson(json);
}
