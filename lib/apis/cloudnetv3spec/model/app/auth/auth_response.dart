import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response.g.dart';
part 'auth_response.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'token') String? token,
    @JsonKey(name: 'id') String? id,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
