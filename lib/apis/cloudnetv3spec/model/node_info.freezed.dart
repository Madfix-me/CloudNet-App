// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NodeInfo _$NodeInfoFromJson(Map<String, dynamic> json) {
  return _NodeInfo.fromJson(json);
}

/// @nodoc
class _$NodeInfoTearOff {
  const _$NodeInfoTearOff();

  _NodeInfo call(
      {@JsonKey(name: 'success')
          bool? success,
      @JsonKey(name: 'version')
          String? version,
      @JsonKey(name: 'nodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? nodeInfoSnapshot,
      @JsonKey(name: 'lastNodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? lastNodeInfoSnapshot,
      @JsonKey(name: 'serviceCount')
          int? serviceCount,
      @JsonKey(name: 'clientConnections')
          List<HostAndPort>? clientConnections}) {
    return _NodeInfo(
      success: success,
      version: version,
      nodeInfoSnapshot: nodeInfoSnapshot,
      lastNodeInfoSnapshot: lastNodeInfoSnapshot,
      serviceCount: serviceCount,
      clientConnections: clientConnections,
    );
  }

  NodeInfo fromJson(Map<String, Object> json) {
    return NodeInfo.fromJson(json);
  }
}

/// @nodoc
const $NodeInfo = _$NodeInfoTearOff();

/// @nodoc
mixin _$NodeInfo {
  @JsonKey(name: 'success')
  bool? get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  String? get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'nodeInfoSnapshot')
  NetworkClusterNodeInfoSnapshot? get nodeInfoSnapshot =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'lastNodeInfoSnapshot')
  NetworkClusterNodeInfoSnapshot? get lastNodeInfoSnapshot =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceCount')
  int? get serviceCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientConnections')
  List<HostAndPort>? get clientConnections =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NodeInfoCopyWith<NodeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeInfoCopyWith<$Res> {
  factory $NodeInfoCopyWith(NodeInfo value, $Res Function(NodeInfo) then) =
      _$NodeInfoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'success')
          bool? success,
      @JsonKey(name: 'version')
          String? version,
      @JsonKey(name: 'nodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? nodeInfoSnapshot,
      @JsonKey(name: 'lastNodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? lastNodeInfoSnapshot,
      @JsonKey(name: 'serviceCount')
          int? serviceCount,
      @JsonKey(name: 'clientConnections')
          List<HostAndPort>? clientConnections});

  $NetworkClusterNodeInfoSnapshotCopyWith<$Res>? get nodeInfoSnapshot;
  $NetworkClusterNodeInfoSnapshotCopyWith<$Res>? get lastNodeInfoSnapshot;
}

/// @nodoc
class _$NodeInfoCopyWithImpl<$Res> implements $NodeInfoCopyWith<$Res> {
  _$NodeInfoCopyWithImpl(this._value, this._then);

  final NodeInfo _value;
  // ignore: unused_field
  final $Res Function(NodeInfo) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? version = freezed,
    Object? nodeInfoSnapshot = freezed,
    Object? lastNodeInfoSnapshot = freezed,
    Object? serviceCount = freezed,
    Object? clientConnections = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeInfoSnapshot: nodeInfoSnapshot == freezed
          ? _value.nodeInfoSnapshot
          : nodeInfoSnapshot // ignore: cast_nullable_to_non_nullable
              as NetworkClusterNodeInfoSnapshot?,
      lastNodeInfoSnapshot: lastNodeInfoSnapshot == freezed
          ? _value.lastNodeInfoSnapshot
          : lastNodeInfoSnapshot // ignore: cast_nullable_to_non_nullable
              as NetworkClusterNodeInfoSnapshot?,
      serviceCount: serviceCount == freezed
          ? _value.serviceCount
          : serviceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      clientConnections: clientConnections == freezed
          ? _value.clientConnections
          : clientConnections // ignore: cast_nullable_to_non_nullable
              as List<HostAndPort>?,
    ));
  }

  @override
  $NetworkClusterNodeInfoSnapshotCopyWith<$Res>? get nodeInfoSnapshot {
    if (_value.nodeInfoSnapshot == null) {
      return null;
    }

    return $NetworkClusterNodeInfoSnapshotCopyWith<$Res>(
        _value.nodeInfoSnapshot!, (value) {
      return _then(_value.copyWith(nodeInfoSnapshot: value));
    });
  }

  @override
  $NetworkClusterNodeInfoSnapshotCopyWith<$Res>? get lastNodeInfoSnapshot {
    if (_value.lastNodeInfoSnapshot == null) {
      return null;
    }

    return $NetworkClusterNodeInfoSnapshotCopyWith<$Res>(
        _value.lastNodeInfoSnapshot!, (value) {
      return _then(_value.copyWith(lastNodeInfoSnapshot: value));
    });
  }
}

/// @nodoc
abstract class _$NodeInfoCopyWith<$Res> implements $NodeInfoCopyWith<$Res> {
  factory _$NodeInfoCopyWith(_NodeInfo value, $Res Function(_NodeInfo) then) =
      __$NodeInfoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'success')
          bool? success,
      @JsonKey(name: 'version')
          String? version,
      @JsonKey(name: 'nodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? nodeInfoSnapshot,
      @JsonKey(name: 'lastNodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? lastNodeInfoSnapshot,
      @JsonKey(name: 'serviceCount')
          int? serviceCount,
      @JsonKey(name: 'clientConnections')
          List<HostAndPort>? clientConnections});

  @override
  $NetworkClusterNodeInfoSnapshotCopyWith<$Res>? get nodeInfoSnapshot;
  @override
  $NetworkClusterNodeInfoSnapshotCopyWith<$Res>? get lastNodeInfoSnapshot;
}

/// @nodoc
class __$NodeInfoCopyWithImpl<$Res> extends _$NodeInfoCopyWithImpl<$Res>
    implements _$NodeInfoCopyWith<$Res> {
  __$NodeInfoCopyWithImpl(_NodeInfo _value, $Res Function(_NodeInfo) _then)
      : super(_value, (v) => _then(v as _NodeInfo));

  @override
  _NodeInfo get _value => super._value as _NodeInfo;

  @override
  $Res call({
    Object? success = freezed,
    Object? version = freezed,
    Object? nodeInfoSnapshot = freezed,
    Object? lastNodeInfoSnapshot = freezed,
    Object? serviceCount = freezed,
    Object? clientConnections = freezed,
  }) {
    return _then(_NodeInfo(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      nodeInfoSnapshot: nodeInfoSnapshot == freezed
          ? _value.nodeInfoSnapshot
          : nodeInfoSnapshot // ignore: cast_nullable_to_non_nullable
              as NetworkClusterNodeInfoSnapshot?,
      lastNodeInfoSnapshot: lastNodeInfoSnapshot == freezed
          ? _value.lastNodeInfoSnapshot
          : lastNodeInfoSnapshot // ignore: cast_nullable_to_non_nullable
              as NetworkClusterNodeInfoSnapshot?,
      serviceCount: serviceCount == freezed
          ? _value.serviceCount
          : serviceCount // ignore: cast_nullable_to_non_nullable
              as int?,
      clientConnections: clientConnections == freezed
          ? _value.clientConnections
          : clientConnections // ignore: cast_nullable_to_non_nullable
              as List<HostAndPort>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NodeInfo implements _NodeInfo {
  _$_NodeInfo(
      {@JsonKey(name: 'success') this.success,
      @JsonKey(name: 'version') this.version,
      @JsonKey(name: 'nodeInfoSnapshot') this.nodeInfoSnapshot,
      @JsonKey(name: 'lastNodeInfoSnapshot') this.lastNodeInfoSnapshot,
      @JsonKey(name: 'serviceCount') this.serviceCount,
      @JsonKey(name: 'clientConnections') this.clientConnections});

  factory _$_NodeInfo.fromJson(Map<String, dynamic> json) =>
      _$$_NodeInfoFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool? success;
  @override
  @JsonKey(name: 'version')
  final String? version;
  @override
  @JsonKey(name: 'nodeInfoSnapshot')
  final NetworkClusterNodeInfoSnapshot? nodeInfoSnapshot;
  @override
  @JsonKey(name: 'lastNodeInfoSnapshot')
  final NetworkClusterNodeInfoSnapshot? lastNodeInfoSnapshot;
  @override
  @JsonKey(name: 'serviceCount')
  final int? serviceCount;
  @override
  @JsonKey(name: 'clientConnections')
  final List<HostAndPort>? clientConnections;

  @override
  String toString() {
    return 'NodeInfo(success: $success, version: $version, nodeInfoSnapshot: $nodeInfoSnapshot, lastNodeInfoSnapshot: $lastNodeInfoSnapshot, serviceCount: $serviceCount, clientConnections: $clientConnections)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NodeInfo &&
            (identical(other.success, success) ||
                const DeepCollectionEquality()
                    .equals(other.success, success)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.nodeInfoSnapshot, nodeInfoSnapshot) ||
                const DeepCollectionEquality()
                    .equals(other.nodeInfoSnapshot, nodeInfoSnapshot)) &&
            (identical(other.lastNodeInfoSnapshot, lastNodeInfoSnapshot) ||
                const DeepCollectionEquality().equals(
                    other.lastNodeInfoSnapshot, lastNodeInfoSnapshot)) &&
            (identical(other.serviceCount, serviceCount) ||
                const DeepCollectionEquality()
                    .equals(other.serviceCount, serviceCount)) &&
            (identical(other.clientConnections, clientConnections) ||
                const DeepCollectionEquality()
                    .equals(other.clientConnections, clientConnections)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(success) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(nodeInfoSnapshot) ^
      const DeepCollectionEquality().hash(lastNodeInfoSnapshot) ^
      const DeepCollectionEquality().hash(serviceCount) ^
      const DeepCollectionEquality().hash(clientConnections);

  @JsonKey(ignore: true)
  @override
  _$NodeInfoCopyWith<_NodeInfo> get copyWith =>
      __$NodeInfoCopyWithImpl<_NodeInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NodeInfoToJson(this);
  }
}

abstract class _NodeInfo implements NodeInfo {
  factory _NodeInfo(
      {@JsonKey(name: 'success')
          bool? success,
      @JsonKey(name: 'version')
          String? version,
      @JsonKey(name: 'nodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? nodeInfoSnapshot,
      @JsonKey(name: 'lastNodeInfoSnapshot')
          NetworkClusterNodeInfoSnapshot? lastNodeInfoSnapshot,
      @JsonKey(name: 'serviceCount')
          int? serviceCount,
      @JsonKey(name: 'clientConnections')
          List<HostAndPort>? clientConnections}) = _$_NodeInfo;

  factory _NodeInfo.fromJson(Map<String, dynamic> json) = _$_NodeInfo.fromJson;

  @override
  @JsonKey(name: 'success')
  bool? get success => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'version')
  String? get version => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'nodeInfoSnapshot')
  NetworkClusterNodeInfoSnapshot? get nodeInfoSnapshot =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastNodeInfoSnapshot')
  NetworkClusterNodeInfoSnapshot? get lastNodeInfoSnapshot =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'serviceCount')
  int? get serviceCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'clientConnections')
  List<HostAndPort>? get clientConnections =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NodeInfoCopyWith<_NodeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
