// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'process_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessSnapshot _$ProcessSnapshotFromJson(Map<String, dynamic> json) {
  return _ProcessSnapshot.fromJson(json);
}

/// @nodoc
class _$ProcessSnapshotTearOff {
  const _$ProcessSnapshotTearOff();

  _ProcessSnapshot call(
      {@JsonKey(name: 'pid') int? pid,
      @JsonKey(name: 'cpuUsage') double? cpuUsage,
      @JsonKey(name: 'systemCpuUsage') double? systemCpuUsage,
      @JsonKey(name: 'maxHeapMemory') int? maxHeapMemory,
      @JsonKey(name: 'heapUsageMemory') int? heapUsageMemory,
      @JsonKey(name: 'noHeapUsageMemory') int? noHeapUsageMemory,
      @JsonKey(name: 'unloadedClassCount') int? unloadedClassCount,
      @JsonKey(name: 'totalLoadedClassCount') int? totalLoadedClassCount,
      @JsonKey(name: 'currentLoadedClassCount') int? currentLoadedClassCount}) {
    return _ProcessSnapshot(
      pid: pid,
      cpuUsage: cpuUsage,
      systemCpuUsage: systemCpuUsage,
      maxHeapMemory: maxHeapMemory,
      heapUsageMemory: heapUsageMemory,
      noHeapUsageMemory: noHeapUsageMemory,
      unloadedClassCount: unloadedClassCount,
      totalLoadedClassCount: totalLoadedClassCount,
      currentLoadedClassCount: currentLoadedClassCount,
    );
  }

  ProcessSnapshot fromJson(Map<String, Object> json) {
    return ProcessSnapshot.fromJson(json);
  }
}

/// @nodoc
const $ProcessSnapshot = _$ProcessSnapshotTearOff();

/// @nodoc
mixin _$ProcessSnapshot {
  @JsonKey(name: 'pid')
  int? get pid => throw _privateConstructorUsedError;
  @JsonKey(name: 'cpuUsage')
  double? get cpuUsage => throw _privateConstructorUsedError;
  @JsonKey(name: 'systemCpuUsage')
  double? get systemCpuUsage => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxHeapMemory')
  int? get maxHeapMemory => throw _privateConstructorUsedError;
  @JsonKey(name: 'heapUsageMemory')
  int? get heapUsageMemory => throw _privateConstructorUsedError;
  @JsonKey(name: 'noHeapUsageMemory')
  int? get noHeapUsageMemory => throw _privateConstructorUsedError;
  @JsonKey(name: 'unloadedClassCount')
  int? get unloadedClassCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalLoadedClassCount')
  int? get totalLoadedClassCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentLoadedClassCount')
  int? get currentLoadedClassCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessSnapshotCopyWith<ProcessSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessSnapshotCopyWith<$Res> {
  factory $ProcessSnapshotCopyWith(
          ProcessSnapshot value, $Res Function(ProcessSnapshot) then) =
      _$ProcessSnapshotCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'pid') int? pid,
      @JsonKey(name: 'cpuUsage') double? cpuUsage,
      @JsonKey(name: 'systemCpuUsage') double? systemCpuUsage,
      @JsonKey(name: 'maxHeapMemory') int? maxHeapMemory,
      @JsonKey(name: 'heapUsageMemory') int? heapUsageMemory,
      @JsonKey(name: 'noHeapUsageMemory') int? noHeapUsageMemory,
      @JsonKey(name: 'unloadedClassCount') int? unloadedClassCount,
      @JsonKey(name: 'totalLoadedClassCount') int? totalLoadedClassCount,
      @JsonKey(name: 'currentLoadedClassCount') int? currentLoadedClassCount});
}

/// @nodoc
class _$ProcessSnapshotCopyWithImpl<$Res>
    implements $ProcessSnapshotCopyWith<$Res> {
  _$ProcessSnapshotCopyWithImpl(this._value, this._then);

  final ProcessSnapshot _value;
  // ignore: unused_field
  final $Res Function(ProcessSnapshot) _then;

  @override
  $Res call({
    Object? pid = freezed,
    Object? cpuUsage = freezed,
    Object? systemCpuUsage = freezed,
    Object? maxHeapMemory = freezed,
    Object? heapUsageMemory = freezed,
    Object? noHeapUsageMemory = freezed,
    Object? unloadedClassCount = freezed,
    Object? totalLoadedClassCount = freezed,
    Object? currentLoadedClassCount = freezed,
  }) {
    return _then(_value.copyWith(
      pid: pid == freezed
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int?,
      cpuUsage: cpuUsage == freezed
          ? _value.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double?,
      systemCpuUsage: systemCpuUsage == freezed
          ? _value.systemCpuUsage
          : systemCpuUsage // ignore: cast_nullable_to_non_nullable
              as double?,
      maxHeapMemory: maxHeapMemory == freezed
          ? _value.maxHeapMemory
          : maxHeapMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      heapUsageMemory: heapUsageMemory == freezed
          ? _value.heapUsageMemory
          : heapUsageMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      noHeapUsageMemory: noHeapUsageMemory == freezed
          ? _value.noHeapUsageMemory
          : noHeapUsageMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      unloadedClassCount: unloadedClassCount == freezed
          ? _value.unloadedClassCount
          : unloadedClassCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLoadedClassCount: totalLoadedClassCount == freezed
          ? _value.totalLoadedClassCount
          : totalLoadedClassCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentLoadedClassCount: currentLoadedClassCount == freezed
          ? _value.currentLoadedClassCount
          : currentLoadedClassCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ProcessSnapshotCopyWith<$Res>
    implements $ProcessSnapshotCopyWith<$Res> {
  factory _$ProcessSnapshotCopyWith(
          _ProcessSnapshot value, $Res Function(_ProcessSnapshot) then) =
      __$ProcessSnapshotCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'pid') int? pid,
      @JsonKey(name: 'cpuUsage') double? cpuUsage,
      @JsonKey(name: 'systemCpuUsage') double? systemCpuUsage,
      @JsonKey(name: 'maxHeapMemory') int? maxHeapMemory,
      @JsonKey(name: 'heapUsageMemory') int? heapUsageMemory,
      @JsonKey(name: 'noHeapUsageMemory') int? noHeapUsageMemory,
      @JsonKey(name: 'unloadedClassCount') int? unloadedClassCount,
      @JsonKey(name: 'totalLoadedClassCount') int? totalLoadedClassCount,
      @JsonKey(name: 'currentLoadedClassCount') int? currentLoadedClassCount});
}

/// @nodoc
class __$ProcessSnapshotCopyWithImpl<$Res>
    extends _$ProcessSnapshotCopyWithImpl<$Res>
    implements _$ProcessSnapshotCopyWith<$Res> {
  __$ProcessSnapshotCopyWithImpl(
      _ProcessSnapshot _value, $Res Function(_ProcessSnapshot) _then)
      : super(_value, (v) => _then(v as _ProcessSnapshot));

  @override
  _ProcessSnapshot get _value => super._value as _ProcessSnapshot;

  @override
  $Res call({
    Object? pid = freezed,
    Object? cpuUsage = freezed,
    Object? systemCpuUsage = freezed,
    Object? maxHeapMemory = freezed,
    Object? heapUsageMemory = freezed,
    Object? noHeapUsageMemory = freezed,
    Object? unloadedClassCount = freezed,
    Object? totalLoadedClassCount = freezed,
    Object? currentLoadedClassCount = freezed,
  }) {
    return _then(_ProcessSnapshot(
      pid: pid == freezed
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as int?,
      cpuUsage: cpuUsage == freezed
          ? _value.cpuUsage
          : cpuUsage // ignore: cast_nullable_to_non_nullable
              as double?,
      systemCpuUsage: systemCpuUsage == freezed
          ? _value.systemCpuUsage
          : systemCpuUsage // ignore: cast_nullable_to_non_nullable
              as double?,
      maxHeapMemory: maxHeapMemory == freezed
          ? _value.maxHeapMemory
          : maxHeapMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      heapUsageMemory: heapUsageMemory == freezed
          ? _value.heapUsageMemory
          : heapUsageMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      noHeapUsageMemory: noHeapUsageMemory == freezed
          ? _value.noHeapUsageMemory
          : noHeapUsageMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      unloadedClassCount: unloadedClassCount == freezed
          ? _value.unloadedClassCount
          : unloadedClassCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalLoadedClassCount: totalLoadedClassCount == freezed
          ? _value.totalLoadedClassCount
          : totalLoadedClassCount // ignore: cast_nullable_to_non_nullable
              as int?,
      currentLoadedClassCount: currentLoadedClassCount == freezed
          ? _value.currentLoadedClassCount
          : currentLoadedClassCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcessSnapshot implements _ProcessSnapshot {
  _$_ProcessSnapshot(
      {@JsonKey(name: 'pid') this.pid,
      @JsonKey(name: 'cpuUsage') this.cpuUsage,
      @JsonKey(name: 'systemCpuUsage') this.systemCpuUsage,
      @JsonKey(name: 'maxHeapMemory') this.maxHeapMemory,
      @JsonKey(name: 'heapUsageMemory') this.heapUsageMemory,
      @JsonKey(name: 'noHeapUsageMemory') this.noHeapUsageMemory,
      @JsonKey(name: 'unloadedClassCount') this.unloadedClassCount,
      @JsonKey(name: 'totalLoadedClassCount') this.totalLoadedClassCount,
      @JsonKey(name: 'currentLoadedClassCount') this.currentLoadedClassCount});

  factory _$_ProcessSnapshot.fromJson(Map<String, dynamic> json) =>
      _$$_ProcessSnapshotFromJson(json);

  @override
  @JsonKey(name: 'pid')
  final int? pid;
  @override
  @JsonKey(name: 'cpuUsage')
  final double? cpuUsage;
  @override
  @JsonKey(name: 'systemCpuUsage')
  final double? systemCpuUsage;
  @override
  @JsonKey(name: 'maxHeapMemory')
  final int? maxHeapMemory;
  @override
  @JsonKey(name: 'heapUsageMemory')
  final int? heapUsageMemory;
  @override
  @JsonKey(name: 'noHeapUsageMemory')
  final int? noHeapUsageMemory;
  @override
  @JsonKey(name: 'unloadedClassCount')
  final int? unloadedClassCount;
  @override
  @JsonKey(name: 'totalLoadedClassCount')
  final int? totalLoadedClassCount;
  @override
  @JsonKey(name: 'currentLoadedClassCount')
  final int? currentLoadedClassCount;

  @override
  String toString() {
    return 'ProcessSnapshot(pid: $pid, cpuUsage: $cpuUsage, systemCpuUsage: $systemCpuUsage, maxHeapMemory: $maxHeapMemory, heapUsageMemory: $heapUsageMemory, noHeapUsageMemory: $noHeapUsageMemory, unloadedClassCount: $unloadedClassCount, totalLoadedClassCount: $totalLoadedClassCount, currentLoadedClassCount: $currentLoadedClassCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProcessSnapshot &&
            (identical(other.pid, pid) ||
                const DeepCollectionEquality().equals(other.pid, pid)) &&
            (identical(other.cpuUsage, cpuUsage) ||
                const DeepCollectionEquality()
                    .equals(other.cpuUsage, cpuUsage)) &&
            (identical(other.systemCpuUsage, systemCpuUsage) ||
                const DeepCollectionEquality()
                    .equals(other.systemCpuUsage, systemCpuUsage)) &&
            (identical(other.maxHeapMemory, maxHeapMemory) ||
                const DeepCollectionEquality()
                    .equals(other.maxHeapMemory, maxHeapMemory)) &&
            (identical(other.heapUsageMemory, heapUsageMemory) ||
                const DeepCollectionEquality()
                    .equals(other.heapUsageMemory, heapUsageMemory)) &&
            (identical(other.noHeapUsageMemory, noHeapUsageMemory) ||
                const DeepCollectionEquality()
                    .equals(other.noHeapUsageMemory, noHeapUsageMemory)) &&
            (identical(other.unloadedClassCount, unloadedClassCount) ||
                const DeepCollectionEquality()
                    .equals(other.unloadedClassCount, unloadedClassCount)) &&
            (identical(other.totalLoadedClassCount, totalLoadedClassCount) ||
                const DeepCollectionEquality().equals(
                    other.totalLoadedClassCount, totalLoadedClassCount)) &&
            (identical(
                    other.currentLoadedClassCount, currentLoadedClassCount) ||
                const DeepCollectionEquality().equals(
                    other.currentLoadedClassCount, currentLoadedClassCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pid) ^
      const DeepCollectionEquality().hash(cpuUsage) ^
      const DeepCollectionEquality().hash(systemCpuUsage) ^
      const DeepCollectionEquality().hash(maxHeapMemory) ^
      const DeepCollectionEquality().hash(heapUsageMemory) ^
      const DeepCollectionEquality().hash(noHeapUsageMemory) ^
      const DeepCollectionEquality().hash(unloadedClassCount) ^
      const DeepCollectionEquality().hash(totalLoadedClassCount) ^
      const DeepCollectionEquality().hash(currentLoadedClassCount);

  @JsonKey(ignore: true)
  @override
  _$ProcessSnapshotCopyWith<_ProcessSnapshot> get copyWith =>
      __$ProcessSnapshotCopyWithImpl<_ProcessSnapshot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProcessSnapshotToJson(this);
  }
}

abstract class _ProcessSnapshot implements ProcessSnapshot {
  factory _ProcessSnapshot(
      {@JsonKey(name: 'pid')
          int? pid,
      @JsonKey(name: 'cpuUsage')
          double? cpuUsage,
      @JsonKey(name: 'systemCpuUsage')
          double? systemCpuUsage,
      @JsonKey(name: 'maxHeapMemory')
          int? maxHeapMemory,
      @JsonKey(name: 'heapUsageMemory')
          int? heapUsageMemory,
      @JsonKey(name: 'noHeapUsageMemory')
          int? noHeapUsageMemory,
      @JsonKey(name: 'unloadedClassCount')
          int? unloadedClassCount,
      @JsonKey(name: 'totalLoadedClassCount')
          int? totalLoadedClassCount,
      @JsonKey(name: 'currentLoadedClassCount')
          int? currentLoadedClassCount}) = _$_ProcessSnapshot;

  factory _ProcessSnapshot.fromJson(Map<String, dynamic> json) =
      _$_ProcessSnapshot.fromJson;

  @override
  @JsonKey(name: 'pid')
  int? get pid => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cpuUsage')
  double? get cpuUsage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'systemCpuUsage')
  double? get systemCpuUsage => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'maxHeapMemory')
  int? get maxHeapMemory => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'heapUsageMemory')
  int? get heapUsageMemory => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'noHeapUsageMemory')
  int? get noHeapUsageMemory => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'unloadedClassCount')
  int? get unloadedClassCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'totalLoadedClassCount')
  int? get totalLoadedClassCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'currentLoadedClassCount')
  int? get currentLoadedClassCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProcessSnapshotCopyWith<_ProcessSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}
