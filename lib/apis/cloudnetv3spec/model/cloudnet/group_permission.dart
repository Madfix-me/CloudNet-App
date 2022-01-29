import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/permission.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_permission.freezed.dart';
part 'group_permission.g.dart';

@freezed
class PermissionGroup with _$PermissionGroup {

  const factory PermissionGroup({
    @JsonKey(name: 'properties') @Default(<String, dynamic>{}) Map<String, dynamic> properties,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'potency') int? potency,
    @JsonKey(name: 'permissions') @Default(<Permission>[]) List<Permission> permissions, // Permission
    //TODO: groupPermission
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'prefix') String? prefix,
    @JsonKey(name: 'suffix') String? suffix,
    @JsonKey(name: 'display') String? display,
    @JsonKey(name: 'sortId') int? sortId,
    @JsonKey(name: 'defaultGroup') @Default(false) bool defaultGroup,
    @JsonKey(name: 'groups') @Default(<String>[]) List<String> groups
}) = _PermissionGroup;


  factory PermissionGroup.fromJson(Map<String, dynamic> json) =>
      _$PermissionGroupFromJson(json);
}
