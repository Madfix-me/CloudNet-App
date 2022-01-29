import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/cluster_config.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/host_and_port.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/network_cluster_node.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/node_ssl_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_config.g.dart';

part 'node_config.freezed.dart';

@freezed
class NodeConfig with _$NodeConfig {
  const factory NodeConfig({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'identity') NetworkClusterNode? identity,
    @JsonKey(name: 'cluterConfig') ClusterConfig? clusterConfig,
    @JsonKey(name: 'maxCPUUsageToStartServices')
        int? maxCPUUsageToStartServices,
    @JsonKey(name: 'maxMemory') int? maxMemory,
    @JsonKey(name: 'maxServiceConsoleLogCacheSize')
        int? maxServiceConsoleLogCacheSize,
    @JsonKey(name: 'processTerminationTimeoutSeconds')
        int? processTerminationTimeoutSeconds,
    @JsonKey(name: 'forceInitialClusterDataSync')
        bool? forceInitialClusterDataSync,
    @JsonKey(name: 'printErrorStreamLinesFromServices')
        bool? printErrorStreamLinesFromServices,
    @JsonKey(name: 'runBlockedServiceStartTryLaterAutomatic')
        bool? runBlockedServiceStartTryLaterAutomatic,
    @JsonKey(name: 'jvmCommand') String? jvmCommand,
    @JsonKey(name: 'hostAddress') String? hostAddress,
    @JsonKey(name: 'connectHostAddress') String? connectHostAddress,
    @JsonKey(name: 'httpListeners')
    @Default(<HostAndPort>[])
        List<HostAndPort> httpListeners,
    @JsonKey(name: 'clientSslConfig') NodeSSLConfig? clientSslConfig,
    @JsonKey(name: 'serverSslConfig') NodeSSLConfig? serverSslConfig,
    @JsonKey(name: 'webSslConfig') NodeSSLConfig? webSslConfig,
  }) = _NodeConfig;

  factory NodeConfig.fromJson(Map<String, dynamic> json) =>
      _$NodeConfigFromJson(json);
}
