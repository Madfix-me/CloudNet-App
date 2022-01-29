import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/permission_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_user_response.freezed.dart';
part 'permission_user_response.g.dart';

@freezed
class PermissionUserResponse with _$PermissionUserResponse {
  const factory PermissionUserResponse({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'user') PermissionUser? user,
  }) = _PermissionUserResponse;

  factory PermissionUserResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionUserResponseFromJson(json);
}
