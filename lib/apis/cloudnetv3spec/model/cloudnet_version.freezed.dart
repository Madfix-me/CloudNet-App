// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cloudnet_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CloudNetVersion _$CloudNetVersionFromJson(Map<String, dynamic> json) {
  return _CloudNetVersion.fromJson(json);
}

/// @nodoc
class _$CloudNetVersionTearOff {
  const _$CloudNetVersionTearOff();

  _CloudNetVersion call(
      {@JsonKey(name: 'major') int? major,
      @JsonKey(name: 'minor') int? minor,
      @JsonKey(name: 'patch') int? patch,
      @JsonKey(name: 'revision') String? revision,
      @JsonKey(name: 'versionType') String? versionType,
      @JsonKey(name: 'versionTitle') String? versionTitle}) {
    return _CloudNetVersion(
      major: major,
      minor: minor,
      patch: patch,
      revision: revision,
      versionType: versionType,
      versionTitle: versionTitle,
    );
  }

  CloudNetVersion fromJson(Map<String, Object> json) {
    return CloudNetVersion.fromJson(json);
  }
}

/// @nodoc
const $CloudNetVersion = _$CloudNetVersionTearOff();

/// @nodoc
mixin _$CloudNetVersion {
  @JsonKey(name: 'major')
  int? get major => throw _privateConstructorUsedError;
  @JsonKey(name: 'minor')
  int? get minor => throw _privateConstructorUsedError;
  @JsonKey(name: 'patch')
  int? get patch => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision')
  String? get revision => throw _privateConstructorUsedError;
  @JsonKey(name: 'versionType')
  String? get versionType => throw _privateConstructorUsedError;
  @JsonKey(name: 'versionTitle')
  String? get versionTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloudNetVersionCopyWith<CloudNetVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudNetVersionCopyWith<$Res> {
  factory $CloudNetVersionCopyWith(
          CloudNetVersion value, $Res Function(CloudNetVersion) then) =
      _$CloudNetVersionCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'major') int? major,
      @JsonKey(name: 'minor') int? minor,
      @JsonKey(name: 'patch') int? patch,
      @JsonKey(name: 'revision') String? revision,
      @JsonKey(name: 'versionType') String? versionType,
      @JsonKey(name: 'versionTitle') String? versionTitle});
}

/// @nodoc
class _$CloudNetVersionCopyWithImpl<$Res>
    implements $CloudNetVersionCopyWith<$Res> {
  _$CloudNetVersionCopyWithImpl(this._value, this._then);

  final CloudNetVersion _value;
  // ignore: unused_field
  final $Res Function(CloudNetVersion) _then;

  @override
  $Res call({
    Object? major = freezed,
    Object? minor = freezed,
    Object? patch = freezed,
    Object? revision = freezed,
    Object? versionType = freezed,
    Object? versionTitle = freezed,
  }) {
    return _then(_value.copyWith(
      major: major == freezed
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int?,
      minor: minor == freezed
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int?,
      patch: patch == freezed
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int?,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String?,
      versionType: versionType == freezed
          ? _value.versionType
          : versionType // ignore: cast_nullable_to_non_nullable
              as String?,
      versionTitle: versionTitle == freezed
          ? _value.versionTitle
          : versionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CloudNetVersionCopyWith<$Res>
    implements $CloudNetVersionCopyWith<$Res> {
  factory _$CloudNetVersionCopyWith(
          _CloudNetVersion value, $Res Function(_CloudNetVersion) then) =
      __$CloudNetVersionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'major') int? major,
      @JsonKey(name: 'minor') int? minor,
      @JsonKey(name: 'patch') int? patch,
      @JsonKey(name: 'revision') String? revision,
      @JsonKey(name: 'versionType') String? versionType,
      @JsonKey(name: 'versionTitle') String? versionTitle});
}

/// @nodoc
class __$CloudNetVersionCopyWithImpl<$Res>
    extends _$CloudNetVersionCopyWithImpl<$Res>
    implements _$CloudNetVersionCopyWith<$Res> {
  __$CloudNetVersionCopyWithImpl(
      _CloudNetVersion _value, $Res Function(_CloudNetVersion) _then)
      : super(_value, (v) => _then(v as _CloudNetVersion));

  @override
  _CloudNetVersion get _value => super._value as _CloudNetVersion;

  @override
  $Res call({
    Object? major = freezed,
    Object? minor = freezed,
    Object? patch = freezed,
    Object? revision = freezed,
    Object? versionType = freezed,
    Object? versionTitle = freezed,
  }) {
    return _then(_CloudNetVersion(
      major: major == freezed
          ? _value.major
          : major // ignore: cast_nullable_to_non_nullable
              as int?,
      minor: minor == freezed
          ? _value.minor
          : minor // ignore: cast_nullable_to_non_nullable
              as int?,
      patch: patch == freezed
          ? _value.patch
          : patch // ignore: cast_nullable_to_non_nullable
              as int?,
      revision: revision == freezed
          ? _value.revision
          : revision // ignore: cast_nullable_to_non_nullable
              as String?,
      versionType: versionType == freezed
          ? _value.versionType
          : versionType // ignore: cast_nullable_to_non_nullable
              as String?,
      versionTitle: versionTitle == freezed
          ? _value.versionTitle
          : versionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CloudNetVersion implements _CloudNetVersion {
  _$_CloudNetVersion(
      {@JsonKey(name: 'major') this.major,
      @JsonKey(name: 'minor') this.minor,
      @JsonKey(name: 'patch') this.patch,
      @JsonKey(name: 'revision') this.revision,
      @JsonKey(name: 'versionType') this.versionType,
      @JsonKey(name: 'versionTitle') this.versionTitle});

  factory _$_CloudNetVersion.fromJson(Map<String, dynamic> json) =>
      _$$_CloudNetVersionFromJson(json);

  @override
  @JsonKey(name: 'major')
  final int? major;
  @override
  @JsonKey(name: 'minor')
  final int? minor;
  @override
  @JsonKey(name: 'patch')
  final int? patch;
  @override
  @JsonKey(name: 'revision')
  final String? revision;
  @override
  @JsonKey(name: 'versionType')
  final String? versionType;
  @override
  @JsonKey(name: 'versionTitle')
  final String? versionTitle;

  @override
  String toString() {
    return 'CloudNetVersion(major: $major, minor: $minor, patch: $patch, revision: $revision, versionType: $versionType, versionTitle: $versionTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CloudNetVersion &&
            (identical(other.major, major) ||
                const DeepCollectionEquality().equals(other.major, major)) &&
            (identical(other.minor, minor) ||
                const DeepCollectionEquality().equals(other.minor, minor)) &&
            (identical(other.patch, patch) ||
                const DeepCollectionEquality().equals(other.patch, patch)) &&
            (identical(other.revision, revision) ||
                const DeepCollectionEquality()
                    .equals(other.revision, revision)) &&
            (identical(other.versionType, versionType) ||
                const DeepCollectionEquality()
                    .equals(other.versionType, versionType)) &&
            (identical(other.versionTitle, versionTitle) ||
                const DeepCollectionEquality()
                    .equals(other.versionTitle, versionTitle)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(major) ^
      const DeepCollectionEquality().hash(minor) ^
      const DeepCollectionEquality().hash(patch) ^
      const DeepCollectionEquality().hash(revision) ^
      const DeepCollectionEquality().hash(versionType) ^
      const DeepCollectionEquality().hash(versionTitle);

  @JsonKey(ignore: true)
  @override
  _$CloudNetVersionCopyWith<_CloudNetVersion> get copyWith =>
      __$CloudNetVersionCopyWithImpl<_CloudNetVersion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CloudNetVersionToJson(this);
  }
}

abstract class _CloudNetVersion implements CloudNetVersion {
  factory _CloudNetVersion(
          {@JsonKey(name: 'major') int? major,
          @JsonKey(name: 'minor') int? minor,
          @JsonKey(name: 'patch') int? patch,
          @JsonKey(name: 'revision') String? revision,
          @JsonKey(name: 'versionType') String? versionType,
          @JsonKey(name: 'versionTitle') String? versionTitle}) =
      _$_CloudNetVersion;

  factory _CloudNetVersion.fromJson(Map<String, dynamic> json) =
      _$_CloudNetVersion.fromJson;

  @override
  @JsonKey(name: 'major')
  int? get major => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'minor')
  int? get minor => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'patch')
  int? get patch => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'revision')
  String? get revision => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'versionType')
  String? get versionType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'versionTitle')
  String? get versionTitle => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CloudNetVersionCopyWith<_CloudNetVersion> get copyWith =>
      throw _privateConstructorUsedError;
}
