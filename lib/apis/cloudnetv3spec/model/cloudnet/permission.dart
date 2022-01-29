import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission.freezed.dart';
part 'permission.g.dart';

@freezed
class Permission with _$Permission {

  const factory Permission({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'potency') int? potency,
    @JsonKey(name: 'timeOutMillis') BigInt? timeOutInMillis
}) = _Permission;


  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
}
