// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network_cluster_node_info_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkClusterNodeInfoSnapshot _$NetworkClusterNodeInfoSnapshotFromJson(
    Map<String, dynamic> json) {
  return _NetworkClusterNodeInfoSnapshot.fromJson(json);
}

/// @nodoc
class _$NetworkClusterNodeInfoSnapshotTearOff {
  const _$NetworkClusterNodeInfoSnapshotTearOff();

  _NetworkClusterNodeInfoSnapshot call(
      {@JsonKey(name: 'creationTime')
          int? creationTime,
      @JsonKey(name: 'startupMillis')
          int? startupMillis,
      @JsonKey(name: 'maxMemory')
          int? maxMemory,
      @JsonKey(name: 'usedMemory')
          int? usedMemory,
      @JsonKey(name: 'reservedMemory')
          int? reservedMemory,
      @JsonKey(name: 'currentServicesCount')
          int? currentServicesCount,
      @JsonKey(name: 'node')
          NetworkClusterNode? node,
      @JsonKey(name: 'version')
          CloudNetVersion? version,
      @JsonKey(name: 'processSnapshot')
          ProcessSnapshot? processSnapshot,
      @JsonKey(name: 'maxCPUUsageToStartServices')
          double? maxCPUUsageToStartServices}) {
    return _NetworkClusterNodeInfoSnapshot(
      creationTime: creationTime,
      startupMillis: startupMillis,
      maxMemory: maxMemory,
      usedMemory: usedMemory,
      reservedMemory: reservedMemory,
      currentServicesCount: currentServicesCount,
      node: node,
      version: version,
      processSnapshot: processSnapshot,
      maxCPUUsageToStartServices: maxCPUUsageToStartServices,
    );
  }

  NetworkClusterNodeInfoSnapshot fromJson(Map<String, Object> json) {
    return NetworkClusterNodeInfoSnapshot.fromJson(json);
  }
}

/// @nodoc
const $NetworkClusterNodeInfoSnapshot =
    _$NetworkClusterNodeInfoSnapshotTearOff();

/// @nodoc
mixin _$NetworkClusterNodeInfoSnapshot {
  @JsonKey(name: 'creationTime')
  int? get creationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'startupMillis')
  int? get startupMillis => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxMemory')
  int? get maxMemory => throw _privateConstructorUsedError;
  @JsonKey(name: 'usedMemory')
  int? get usedMemory => throw _privateConstructorUsedError;
  @JsonKey(name: 'reservedMemory')
  int? get reservedMemory => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentServicesCount')
  int? get currentServicesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  NetworkClusterNode? get node => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  CloudNetVersion? get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'processSnapshot')
  ProcessSnapshot? get processSnapshot => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxCPUUsageToStartServices')
  double? get maxCPUUsageToStartServices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkClusterNodeInfoSnapshotCopyWith<NetworkClusterNodeInfoSnapshot>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkClusterNodeInfoSnapshotCopyWith<$Res> {
  factory $NetworkClusterNodeInfoSnapshotCopyWith(
          NetworkClusterNodeInfoSnapshot value,
          $Res Function(NetworkClusterNodeInfoSnapshot) then) =
      _$NetworkClusterNodeInfoSnapshotCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'creationTime')
          int? creationTime,
      @JsonKey(name: 'startupMillis')
          int? startupMillis,
      @JsonKey(name: 'maxMemory')
          int? maxMemory,
      @JsonKey(name: 'usedMemory')
          int? usedMemory,
      @JsonKey(name: 'reservedMemory')
          int? reservedMemory,
      @JsonKey(name: 'currentServicesCount')
          int? currentServicesCount,
      @JsonKey(name: 'node')
          NetworkClusterNode? node,
      @JsonKey(name: 'version')
          CloudNetVersion? version,
      @JsonKey(name: 'processSnapshot')
          ProcessSnapshot? processSnapshot,
      @JsonKey(name: 'maxCPUUsageToStartServices')
          double? maxCPUUsageToStartServices});

  $NetworkClusterNodeCopyWith<$Res>? get node;
  $CloudNetVersionCopyWith<$Res>? get version;
  $ProcessSnapshotCopyWith<$Res>? get processSnapshot;
}

/// @nodoc
class _$NetworkClusterNodeInfoSnapshotCopyWithImpl<$Res>
    implements $NetworkClusterNodeInfoSnapshotCopyWith<$Res> {
  _$NetworkClusterNodeInfoSnapshotCopyWithImpl(this._value, this._then);

  final NetworkClusterNodeInfoSnapshot _value;
  // ignore: unused_field
  final $Res Function(NetworkClusterNodeInfoSnapshot) _then;

  @override
  $Res call({
    Object? creationTime = freezed,
    Object? startupMillis = freezed,
    Object? maxMemory = freezed,
    Object? usedMemory = freezed,
    Object? reservedMemory = freezed,
    Object? currentServicesCount = freezed,
    Object? node = freezed,
    Object? version = freezed,
    Object? processSnapshot = freezed,
    Object? maxCPUUsageToStartServices = freezed,
  }) {
    return _then(_value.copyWith(
      creationTime: creationTime == freezed
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      startupMillis: startupMillis == freezed
          ? _value.startupMillis
          : startupMillis // ignore: cast_nullable_to_non_nullable
              as int?,
      maxMemory: maxMemory == freezed
          ? _value.maxMemory
          : maxMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      usedMemory: usedMemory == freezed
          ? _value.usedMemory
          : usedMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      reservedMemory: reservedMemory == freezed
          ? _value.reservedMemory
          : reservedMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      currentServicesCount: currentServicesCount == freezed
          ? _value.currentServicesCount
          : currentServicesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as NetworkClusterNode?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as CloudNetVersion?,
      processSnapshot: processSnapshot == freezed
          ? _value.processSnapshot
          : processSnapshot // ignore: cast_nullable_to_non_nullable
              as ProcessSnapshot?,
      maxCPUUsageToStartServices: maxCPUUsageToStartServices == freezed
          ? _value.maxCPUUsageToStartServices
          : maxCPUUsageToStartServices // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  @override
  $NetworkClusterNodeCopyWith<$Res>? get node {
    if (_value.node == null) {
      return null;
    }

    return $NetworkClusterNodeCopyWith<$Res>(_value.node!, (value) {
      return _then(_value.copyWith(node: value));
    });
  }

  @override
  $CloudNetVersionCopyWith<$Res>? get version {
    if (_value.version == null) {
      return null;
    }

    return $CloudNetVersionCopyWith<$Res>(_value.version!, (value) {
      return _then(_value.copyWith(version: value));
    });
  }

  @override
  $ProcessSnapshotCopyWith<$Res>? get processSnapshot {
    if (_value.processSnapshot == null) {
      return null;
    }

    return $ProcessSnapshotCopyWith<$Res>(_value.processSnapshot!, (value) {
      return _then(_value.copyWith(processSnapshot: value));
    });
  }
}

/// @nodoc
abstract class _$NetworkClusterNodeInfoSnapshotCopyWith<$Res>
    implements $NetworkClusterNodeInfoSnapshotCopyWith<$Res> {
  factory _$NetworkClusterNodeInfoSnapshotCopyWith(
          _NetworkClusterNodeInfoSnapshot value,
          $Res Function(_NetworkClusterNodeInfoSnapshot) then) =
      __$NetworkClusterNodeInfoSnapshotCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'creationTime')
          int? creationTime,
      @JsonKey(name: 'startupMillis')
          int? startupMillis,
      @JsonKey(name: 'maxMemory')
          int? maxMemory,
      @JsonKey(name: 'usedMemory')
          int? usedMemory,
      @JsonKey(name: 'reservedMemory')
          int? reservedMemory,
      @JsonKey(name: 'currentServicesCount')
          int? currentServicesCount,
      @JsonKey(name: 'node')
          NetworkClusterNode? node,
      @JsonKey(name: 'version')
          CloudNetVersion? version,
      @JsonKey(name: 'processSnapshot')
          ProcessSnapshot? processSnapshot,
      @JsonKey(name: 'maxCPUUsageToStartServices')
          double? maxCPUUsageToStartServices});

  @override
  $NetworkClusterNodeCopyWith<$Res>? get node;
  @override
  $CloudNetVersionCopyWith<$Res>? get version;
  @override
  $ProcessSnapshotCopyWith<$Res>? get processSnapshot;
}

/// @nodoc
class __$NetworkClusterNodeInfoSnapshotCopyWithImpl<$Res>
    extends _$NetworkClusterNodeInfoSnapshotCopyWithImpl<$Res>
    implements _$NetworkClusterNodeInfoSnapshotCopyWith<$Res> {
  __$NetworkClusterNodeInfoSnapshotCopyWithImpl(
      _NetworkClusterNodeInfoSnapshot _value,
      $Res Function(_NetworkClusterNodeInfoSnapshot) _then)
      : super(_value, (v) => _then(v as _NetworkClusterNodeInfoSnapshot));

  @override
  _NetworkClusterNodeInfoSnapshot get _value =>
      super._value as _NetworkClusterNodeInfoSnapshot;

  @override
  $Res call({
    Object? creationTime = freezed,
    Object? startupMillis = freezed,
    Object? maxMemory = freezed,
    Object? usedMemory = freezed,
    Object? reservedMemory = freezed,
    Object? currentServicesCount = freezed,
    Object? node = freezed,
    Object? version = freezed,
    Object? processSnapshot = freezed,
    Object? maxCPUUsageToStartServices = freezed,
  }) {
    return _then(_NetworkClusterNodeInfoSnapshot(
      creationTime: creationTime == freezed
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      startupMillis: startupMillis == freezed
          ? _value.startupMillis
          : startupMillis // ignore: cast_nullable_to_non_nullable
              as int?,
      maxMemory: maxMemory == freezed
          ? _value.maxMemory
          : maxMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      usedMemory: usedMemory == freezed
          ? _value.usedMemory
          : usedMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      reservedMemory: reservedMemory == freezed
          ? _value.reservedMemory
          : reservedMemory // ignore: cast_nullable_to_non_nullable
              as int?,
      currentServicesCount: currentServicesCount == freezed
          ? _value.currentServicesCount
          : currentServicesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      node: node == freezed
          ? _value.node
          : node // ignore: cast_nullable_to_non_nullable
              as NetworkClusterNode?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as CloudNetVersion?,
      processSnapshot: processSnapshot == freezed
          ? _value.processSnapshot
          : processSnapshot // ignore: cast_nullable_to_non_nullable
              as ProcessSnapshot?,
      maxCPUUsageToStartServices: maxCPUUsageToStartServices == freezed
          ? _value.maxCPUUsageToStartServices
          : maxCPUUsageToStartServices // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetworkClusterNodeInfoSnapshot
    implements _NetworkClusterNodeInfoSnapshot {
  _$_NetworkClusterNodeInfoSnapshot(
      {@JsonKey(name: 'creationTime')
          this.creationTime,
      @JsonKey(name: 'startupMillis')
          this.startupMillis,
      @JsonKey(name: 'maxMemory')
          this.maxMemory,
      @JsonKey(name: 'usedMemory')
          this.usedMemory,
      @JsonKey(name: 'reservedMemory')
          this.reservedMemory,
      @JsonKey(name: 'currentServicesCount')
          this.currentServicesCount,
      @JsonKey(name: 'node')
          this.node,
      @JsonKey(name: 'version')
          this.version,
      @JsonKey(name: 'processSnapshot')
          this.processSnapshot,
      @JsonKey(name: 'maxCPUUsageToStartServices')
          this.maxCPUUsageToStartServices});

  factory _$_NetworkClusterNodeInfoSnapshot.fromJson(
          Map<String, dynamic> json) =>
      _$$_NetworkClusterNodeInfoSnapshotFromJson(json);

  @override
  @JsonKey(name: 'creationTime')
  final int? creationTime;
  @override
  @JsonKey(name: 'startupMillis')
  final int? startupMillis;
  @override
  @JsonKey(name: 'maxMemory')
  final int? maxMemory;
  @override
  @JsonKey(name: 'usedMemory')
  final int? usedMemory;
  @override
  @JsonKey(name: 'reservedMemory')
  final int? reservedMemory;
  @override
  @JsonKey(name: 'currentServicesCount')
  final int? currentServicesCount;
  @override
  @JsonKey(name: 'node')
  final NetworkClusterNode? node;
  @override
  @JsonKey(name: 'version')
  final CloudNetVersion? version;
  @override
  @JsonKey(name: 'processSnapshot')
  final ProcessSnapshot? processSnapshot;
  @override
  @JsonKey(name: 'maxCPUUsageToStartServices')
  final double? maxCPUUsageToStartServices;

  @override
  String toString() {
    return 'NetworkClusterNodeInfoSnapshot(creationTime: $creationTime, startupMillis: $startupMillis, maxMemory: $maxMemory, usedMemory: $usedMemory, reservedMemory: $reservedMemory, currentServicesCount: $currentServicesCount, node: $node, version: $version, processSnapshot: $processSnapshot, maxCPUUsageToStartServices: $maxCPUUsageToStartServices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NetworkClusterNodeInfoSnapshot &&
            (identical(other.creationTime, creationTime) ||
                const DeepCollectionEquality()
                    .equals(other.creationTime, creationTime)) &&
            (identical(other.startupMillis, startupMillis) ||
                const DeepCollectionEquality()
                    .equals(other.startupMillis, startupMillis)) &&
            (identical(other.maxMemory, maxMemory) ||
                const DeepCollectionEquality()
                    .equals(other.maxMemory, maxMemory)) &&
            (identical(other.usedMemory, usedMemory) ||
                const DeepCollectionEquality()
                    .equals(other.usedMemory, usedMemory)) &&
            (identical(other.reservedMemory, reservedMemory) ||
                const DeepCollectionEquality()
                    .equals(other.reservedMemory, reservedMemory)) &&
            (identical(other.currentServicesCount, currentServicesCount) ||
                const DeepCollectionEquality().equals(
                    other.currentServicesCount, currentServicesCount)) &&
            (identical(other.node, node) ||
                const DeepCollectionEquality().equals(other.node, node)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.processSnapshot, processSnapshot) ||
                const DeepCollectionEquality()
                    .equals(other.processSnapshot, processSnapshot)) &&
            (identical(other.maxCPUUsageToStartServices,
                    maxCPUUsageToStartServices) ||
                const DeepCollectionEquality().equals(
                    other.maxCPUUsageToStartServices,
                    maxCPUUsageToStartServices)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(creationTime) ^
      const DeepCollectionEquality().hash(startupMillis) ^
      const DeepCollectionEquality().hash(maxMemory) ^
      const DeepCollectionEquality().hash(usedMemory) ^
      const DeepCollectionEquality().hash(reservedMemory) ^
      const DeepCollectionEquality().hash(currentServicesCount) ^
      const DeepCollectionEquality().hash(node) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(processSnapshot) ^
      const DeepCollectionEquality().hash(maxCPUUsageToStartServices);

  @JsonKey(ignore: true)
  @override
  _$NetworkClusterNodeInfoSnapshotCopyWith<_NetworkClusterNodeInfoSnapshot>
      get copyWith => __$NetworkClusterNodeInfoSnapshotCopyWithImpl<
          _NetworkClusterNodeInfoSnapshot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkClusterNodeInfoSnapshotToJson(this);
  }
}

abstract class _NetworkClusterNodeInfoSnapshot
    implements NetworkClusterNodeInfoSnapshot {
  factory _NetworkClusterNodeInfoSnapshot(
          {@JsonKey(name: 'creationTime')
              int? creationTime,
          @JsonKey(name: 'startupMillis')
              int? startupMillis,
          @JsonKey(name: 'maxMemory')
              int? maxMemory,
          @JsonKey(name: 'usedMemory')
              int? usedMemory,
          @JsonKey(name: 'reservedMemory')
              int? reservedMemory,
          @JsonKey(name: 'currentServicesCount')
              int? currentServicesCount,
          @JsonKey(name: 'node')
              NetworkClusterNode? node,
          @JsonKey(name: 'version')
              CloudNetVersion? version,
          @JsonKey(name: 'processSnapshot')
              ProcessSnapshot? processSnapshot,
          @JsonKey(name: 'maxCPUUsageToStartServices')
              double? maxCPUUsageToStartServices}) =
      _$_NetworkClusterNodeInfoSnapshot;

  factory _NetworkClusterNodeInfoSnapshot.fromJson(Map<String, dynamic> json) =
      _$_NetworkClusterNodeInfoSnapshot.fromJson;

  @override
  @JsonKey(name: 'creationTime')
  int? get creationTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'startupMillis')
  int? get startupMillis => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'maxMemory')
  int? get maxMemory => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'usedMemory')
  int? get usedMemory => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'reservedMemory')
  int? get reservedMemory => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'currentServicesCount')
  int? get currentServicesCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'node')
  NetworkClusterNode? get node => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'version')
  CloudNetVersion? get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'processSnapshot')
  ProcessSnapshot? get processSnapshot => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'maxCPUUsageToStartServices')
  double? get maxCPUUsageToStartServices => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NetworkClusterNodeInfoSnapshotCopyWith<_NetworkClusterNodeInfoSnapshot>
      get copyWith => throw _privateConstructorUsedError;
}
