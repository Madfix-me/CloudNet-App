import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/group_permission.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_group_response.freezed.dart';

part 'permission_group_response.g.dart';

@freezed
class PermissionGroupResponse with _$PermissionGroupResponse {
  const factory PermissionGroupResponse(
      {@JsonKey(name: 'success')
      @Default(false)
          bool success,
      @JsonKey(name: 'groups')
      @Default(<PermissionGroup>[])
          List<PermissionGroup> groups}) = _PermissionGroupResponse;

  factory PermissionGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionGroupResponseFromJson(json);
}
