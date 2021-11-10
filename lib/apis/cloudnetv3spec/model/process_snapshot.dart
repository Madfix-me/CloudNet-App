

import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_snapshot.g.dart';
part 'process_snapshot.freezed.dart';

@freezed
class ProcessSnapshot with _$ProcessSnapshot {

  factory ProcessSnapshot({
    @JsonKey(name: 'pid') int? pid,
    @JsonKey(name: 'cpuUsage') double? cpuUsage,
    @JsonKey(name: 'systemCpuUsage') double? systemCpuUsage,
    @JsonKey(name: 'maxHeapMemory') int? maxHeapMemory,
    @JsonKey(name: 'heapUsageMemory') int? heapUsageMemory,
    @JsonKey(name: 'noHeapUsageMemory') int? noHeapUsageMemory,
    @JsonKey(name: 'unloadedClassCount') int? unloadedClassCount,
    @JsonKey(name: 'totalLoadedClassCount') int? totalLoadedClassCount,
    @JsonKey(name: 'currentLoadedClassCount') int? currentLoadedClassCount,
  }) = _ProcessSnapshot;

  factory ProcessSnapshot.fromJson(Map<String, dynamic> json) => _$ProcessSnapshotFromJson(json);

}