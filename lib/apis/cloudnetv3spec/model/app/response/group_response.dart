import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/group_configuration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_response.freezed.dart';

part 'group_response.g.dart';

@freezed
class GroupResponse with _$GroupResponse {
  const factory GroupResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'reason') String? reason,
    @JsonKey(name: 'groups')
    @Default(<GroupConfiguration>[])
        List<GroupConfiguration> groups,
  }) = _GroupResponse;

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);
}
