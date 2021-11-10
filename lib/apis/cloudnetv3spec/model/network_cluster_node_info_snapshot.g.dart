// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_cluster_node_info_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NetworkClusterNodeInfoSnapshot _$$_NetworkClusterNodeInfoSnapshotFromJson(
        Map<String, dynamic> json) =>
    _$_NetworkClusterNodeInfoSnapshot(
      creationTime: json['creationTime'] as int?,
      startupMillis: json['startupMillis'] as int?,
      maxMemory: json['maxMemory'] as int?,
      usedMemory: json['usedMemory'] as int?,
      reservedMemory: json['reservedMemory'] as int?,
      currentServicesCount: json['currentServicesCount'] as int?,
      node: json['node'] == null
          ? null
          : NetworkClusterNode.fromJson(json['node'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : CloudNetVersion.fromJson(json['version'] as Map<String, dynamic>),
      processSnapshot: json['processSnapshot'] == null
          ? null
          : ProcessSnapshot.fromJson(
              json['processSnapshot'] as Map<String, dynamic>),
      maxCPUUsageToStartServices:
          (json['maxCPUUsageToStartServices'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_NetworkClusterNodeInfoSnapshotToJson(
        _$_NetworkClusterNodeInfoSnapshot instance) =>
    <String, dynamic>{
      'creationTime': instance.creationTime,
      'startupMillis': instance.startupMillis,
      'maxMemory': instance.maxMemory,
      'usedMemory': instance.usedMemory,
      'reservedMemory': instance.reservedMemory,
      'currentServicesCount': instance.currentServicesCount,
      'node': instance.node,
      'version': instance.version,
      'processSnapshot': instance.processSnapshot,
      'maxCPUUsageToStartServices': instance.maxCPUUsageToStartServices,
    };
