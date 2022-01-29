import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/module.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/version.dart';

import 'process_snapshot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_cluster_node.dart';

part 'network_cluster_node_info_snapshot.g.dart';
part 'network_cluster_node_info_snapshot.freezed.dart';

@freezed
class NetworkClusterNodeInfoSnapshot with _$NetworkClusterNodeInfoSnapshot {
  factory NetworkClusterNodeInfoSnapshot({
    @JsonKey(name: 'creationTime') int? creationTime,
    @JsonKey(name: 'startupMillis') int? startupMillis,
    @JsonKey(name: 'maxMemory') int? maxMemory,
    @JsonKey(name: 'usedMemory') int? usedMemory,
    @JsonKey(name: 'reservedMemory') int? reservedMemory,
    @JsonKey(name: 'currentServicesCount') int? currentServicesCount,
    @JsonKey(name: 'drain') @Default(false) bool drain,
    @JsonKey(name: 'node') NetworkClusterNode? node,
    @JsonKey(name: 'version') Version? version,
    @JsonKey(name: 'processSnapshot') ProcessSnapshot? processSnapshot,
    @JsonKey(name: 'module') @Default(<Module>[])List<Module>? modules,
    @JsonKey(name: 'maxCPUUsageToStartServices')
        double? maxCPUUsageToStartServices,
  }) = _NetworkClusterNodeInfoSnapshot;

  factory NetworkClusterNodeInfoSnapshot.fromJson(Map<String, dynamic> json) =>
      _$NetworkClusterNodeInfoSnapshotFromJson(json);
}
