// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProcessSnapshot _$$_ProcessSnapshotFromJson(Map<String, dynamic> json) =>
    _$_ProcessSnapshot(
      pid: json['pid'] as int?,
      cpuUsage: (json['cpuUsage'] as num?)?.toDouble(),
      systemCpuUsage: (json['systemCpuUsage'] as num?)?.toDouble(),
      maxHeapMemory: json['maxHeapMemory'] as int?,
      heapUsageMemory: json['heapUsageMemory'] as int?,
      noHeapUsageMemory: json['noHeapUsageMemory'] as int?,
      unloadedClassCount: json['unloadedClassCount'] as int?,
      totalLoadedClassCount: json['totalLoadedClassCount'] as int?,
      currentLoadedClassCount: json['currentLoadedClassCount'] as int?,
    );

Map<String, dynamic> _$$_ProcessSnapshotToJson(_$_ProcessSnapshot instance) =>
    <String, dynamic>{
      'pid': instance.pid,
      'cpuUsage': instance.cpuUsage,
      'systemCpuUsage': instance.systemCpuUsage,
      'maxHeapMemory': instance.maxHeapMemory,
      'heapUsageMemory': instance.heapUsageMemory,
      'noHeapUsageMemory': instance.noHeapUsageMemory,
      'unloadedClassCount': instance.unloadedClassCount,
      'totalLoadedClassCount': instance.totalLoadedClassCount,
      'currentLoadedClassCount': instance.currentLoadedClassCount,
    };
