import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_user_group.g.dart';

part 'permission_user_group.freezed.dart';

@freezed
class PermissionUserGroup with _$PermissionUserGroup {
  const factory PermissionUserGroup(
          {@JsonKey(name: 'group') String? group,
          @JsonKey(name: 'timeOutMillis') BigInt? timeOutMillis}) =
      _PermissionUserGroup;

  factory PermissionUserGroup.fromJson(Map<String, dynamic> json) =>
      _$PermissionUserGroupFromJson(json);
}
