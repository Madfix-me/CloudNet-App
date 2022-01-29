import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/node_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_response.freezed.dart';
part 'node_response.g.dart';

@freezed
class NodesResponse with _$NodesResponse {
  const factory NodesResponse(
      {@JsonKey(name: 'nodes') @Default(<NodeInfo>[]) List<NodeInfo> nodes,
      @JsonKey(name: 'success') @Default(false) bool success,
      @JsonKey(name: 'reason') @Default(null) String reason}) = _NodesResponse;

  factory NodesResponse.fromJson(Map<String, dynamic> json) =>
      _$NodesResponseFromJson(json);
}
