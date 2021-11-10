// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'network_cluster_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkClusterNode _$NetworkClusterNodeFromJson(Map<String, dynamic> json) {
  return _NetworkClusterNode.fromJson(json);
}

/// @nodoc
class _$NetworkClusterNodeTearOff {
  const _$NetworkClusterNodeTearOff();

  _NetworkClusterNode call(
      {@JsonKey(name: 'uniqueId') String? uniqueId,
      @JsonKey(name: 'listeners') List<HostAndPort>? listeners}) {
    return _NetworkClusterNode(
      uniqueId: uniqueId,
      listeners: listeners,
    );
  }

  NetworkClusterNode fromJson(Map<String, Object> json) {
    return NetworkClusterNode.fromJson(json);
  }
}

/// @nodoc
const $NetworkClusterNode = _$NetworkClusterNodeTearOff();

/// @nodoc
mixin _$NetworkClusterNode {
  @JsonKey(name: 'uniqueId')
  String? get uniqueId => throw _privateConstructorUsedError;
  @JsonKey(name: 'listeners')
  List<HostAndPort>? get listeners => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkClusterNodeCopyWith<NetworkClusterNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkClusterNodeCopyWith<$Res> {
  factory $NetworkClusterNodeCopyWith(
          NetworkClusterNode value, $Res Function(NetworkClusterNode) then) =
      _$NetworkClusterNodeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'uniqueId') String? uniqueId,
      @JsonKey(name: 'listeners') List<HostAndPort>? listeners});
}

/// @nodoc
class _$NetworkClusterNodeCopyWithImpl<$Res>
    implements $NetworkClusterNodeCopyWith<$Res> {
  _$NetworkClusterNodeCopyWithImpl(this._value, this._then);

  final NetworkClusterNode _value;
  // ignore: unused_field
  final $Res Function(NetworkClusterNode) _then;

  @override
  $Res call({
    Object? uniqueId = freezed,
    Object? listeners = freezed,
  }) {
    return _then(_value.copyWith(
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      listeners: listeners == freezed
          ? _value.listeners
          : listeners // ignore: cast_nullable_to_non_nullable
              as List<HostAndPort>?,
    ));
  }
}

/// @nodoc
abstract class _$NetworkClusterNodeCopyWith<$Res>
    implements $NetworkClusterNodeCopyWith<$Res> {
  factory _$NetworkClusterNodeCopyWith(
          _NetworkClusterNode value, $Res Function(_NetworkClusterNode) then) =
      __$NetworkClusterNodeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'uniqueId') String? uniqueId,
      @JsonKey(name: 'listeners') List<HostAndPort>? listeners});
}

/// @nodoc
class __$NetworkClusterNodeCopyWithImpl<$Res>
    extends _$NetworkClusterNodeCopyWithImpl<$Res>
    implements _$NetworkClusterNodeCopyWith<$Res> {
  __$NetworkClusterNodeCopyWithImpl(
      _NetworkClusterNode _value, $Res Function(_NetworkClusterNode) _then)
      : super(_value, (v) => _then(v as _NetworkClusterNode));

  @override
  _NetworkClusterNode get _value => super._value as _NetworkClusterNode;

  @override
  $Res call({
    Object? uniqueId = freezed,
    Object? listeners = freezed,
  }) {
    return _then(_NetworkClusterNode(
      uniqueId: uniqueId == freezed
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String?,
      listeners: listeners == freezed
          ? _value.listeners
          : listeners // ignore: cast_nullable_to_non_nullable
              as List<HostAndPort>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetworkClusterNode implements _NetworkClusterNode {
  _$_NetworkClusterNode(
      {@JsonKey(name: 'uniqueId') this.uniqueId,
      @JsonKey(name: 'listeners') this.listeners});

  factory _$_NetworkClusterNode.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkClusterNodeFromJson(json);

  @override
  @JsonKey(name: 'uniqueId')
  final String? uniqueId;
  @override
  @JsonKey(name: 'listeners')
  final List<HostAndPort>? listeners;

  @override
  String toString() {
    return 'NetworkClusterNode(uniqueId: $uniqueId, listeners: $listeners)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NetworkClusterNode &&
            (identical(other.uniqueId, uniqueId) ||
                const DeepCollectionEquality()
                    .equals(other.uniqueId, uniqueId)) &&
            (identical(other.listeners, listeners) ||
                const DeepCollectionEquality()
                    .equals(other.listeners, listeners)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uniqueId) ^
      const DeepCollectionEquality().hash(listeners);

  @JsonKey(ignore: true)
  @override
  _$NetworkClusterNodeCopyWith<_NetworkClusterNode> get copyWith =>
      __$NetworkClusterNodeCopyWithImpl<_NetworkClusterNode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkClusterNodeToJson(this);
  }
}

abstract class _NetworkClusterNode implements NetworkClusterNode {
  factory _NetworkClusterNode(
          {@JsonKey(name: 'uniqueId') String? uniqueId,
          @JsonKey(name: 'listeners') List<HostAndPort>? listeners}) =
      _$_NetworkClusterNode;

  factory _NetworkClusterNode.fromJson(Map<String, dynamic> json) =
      _$_NetworkClusterNode.fromJson;

  @override
  @JsonKey(name: 'uniqueId')
  String? get uniqueId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'listeners')
  List<HostAndPort>? get listeners => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NetworkClusterNodeCopyWith<_NetworkClusterNode> get copyWith =>
      throw _privateConstructorUsedError;
}
