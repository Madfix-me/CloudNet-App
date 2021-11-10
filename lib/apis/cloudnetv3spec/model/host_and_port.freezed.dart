// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'host_and_port.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HostAndPort _$HostAndPortFromJson(Map<String, dynamic> json) {
  return _HostAndPort.fromJson(json);
}

/// @nodoc
class _$HostAndPortTearOff {
  const _$HostAndPortTearOff();

  _HostAndPort call(
      {@JsonKey(name: 'host') String? host, @JsonKey(name: 'port') int? port}) {
    return _HostAndPort(
      host: host,
      port: port,
    );
  }

  HostAndPort fromJson(Map<String, Object> json) {
    return HostAndPort.fromJson(json);
  }
}

/// @nodoc
const $HostAndPort = _$HostAndPortTearOff();

/// @nodoc
mixin _$HostAndPort {
  @JsonKey(name: 'host')
  String? get host => throw _privateConstructorUsedError;
  @JsonKey(name: 'port')
  int? get port => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostAndPortCopyWith<HostAndPort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostAndPortCopyWith<$Res> {
  factory $HostAndPortCopyWith(
          HostAndPort value, $Res Function(HostAndPort) then) =
      _$HostAndPortCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'host') String? host, @JsonKey(name: 'port') int? port});
}

/// @nodoc
class _$HostAndPortCopyWithImpl<$Res> implements $HostAndPortCopyWith<$Res> {
  _$HostAndPortCopyWithImpl(this._value, this._then);

  final HostAndPort _value;
  // ignore: unused_field
  final $Res Function(HostAndPort) _then;

  @override
  $Res call({
    Object? host = freezed,
    Object? port = freezed,
  }) {
    return _then(_value.copyWith(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$HostAndPortCopyWith<$Res>
    implements $HostAndPortCopyWith<$Res> {
  factory _$HostAndPortCopyWith(
          _HostAndPort value, $Res Function(_HostAndPort) then) =
      __$HostAndPortCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'host') String? host, @JsonKey(name: 'port') int? port});
}

/// @nodoc
class __$HostAndPortCopyWithImpl<$Res> extends _$HostAndPortCopyWithImpl<$Res>
    implements _$HostAndPortCopyWith<$Res> {
  __$HostAndPortCopyWithImpl(
      _HostAndPort _value, $Res Function(_HostAndPort) _then)
      : super(_value, (v) => _then(v as _HostAndPort));

  @override
  _HostAndPort get _value => super._value as _HostAndPort;

  @override
  $Res call({
    Object? host = freezed,
    Object? port = freezed,
  }) {
    return _then(_HostAndPort(
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      port: port == freezed
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HostAndPort implements _HostAndPort {
  _$_HostAndPort(
      {@JsonKey(name: 'host') this.host, @JsonKey(name: 'port') this.port});

  factory _$_HostAndPort.fromJson(Map<String, dynamic> json) =>
      _$$_HostAndPortFromJson(json);

  @override
  @JsonKey(name: 'host')
  final String? host;
  @override
  @JsonKey(name: 'port')
  final int? port;

  @override
  String toString() {
    return 'HostAndPort(host: $host, port: $port)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HostAndPort &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.port, port) ||
                const DeepCollectionEquality().equals(other.port, port)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(port);

  @JsonKey(ignore: true)
  @override
  _$HostAndPortCopyWith<_HostAndPort> get copyWith =>
      __$HostAndPortCopyWithImpl<_HostAndPort>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HostAndPortToJson(this);
  }
}

abstract class _HostAndPort implements HostAndPort {
  factory _HostAndPort(
      {@JsonKey(name: 'host') String? host,
      @JsonKey(name: 'port') int? port}) = _$_HostAndPort;

  factory _HostAndPort.fromJson(Map<String, dynamic> json) =
      _$_HostAndPort.fromJson;

  @override
  @JsonKey(name: 'host')
  String? get host => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'port')
  int? get port => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HostAndPortCopyWith<_HostAndPort> get copyWith =>
      throw _privateConstructorUsedError;
}
