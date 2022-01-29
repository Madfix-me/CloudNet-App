import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/permission.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/permission_user_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_user.freezed.dart';

part 'permission_user.g.dart';

@freezed
class PermissionUser with _$PermissionUser {
  const factory PermissionUser({
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'potency') int? potency,
    @JsonKey(name: 'createdTime') BigInt? createdTime,
    @JsonKey(name: 'permission')
    @Default(<Permission>[])
        List<Permission> permissions,
    // TODO: groupPermissions,
    @JsonKey(name: 'uniqueId') String? uniqueId,
    @JsonKey(name: 'hashedPassword') String? hashedPassword,
    @JsonKey(name: 'groups')
    @Default(<PermissionUserGroup>[])
        List<PermissionUserGroup> groups,
  }) = _PermissionUser;

  factory PermissionUser.fromJson(Map<String, dynamic> json) =>
      _$PermissionUserFromJson(json);
}
