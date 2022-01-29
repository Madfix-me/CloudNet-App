import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_remote_inclusion.freezed.dart';

part 'service_remote_inclusion.g.dart';

@freezed
class ServiceRemoteInclusion with _$ServiceRemoteInclusion {
  const factory ServiceRemoteInclusion({
    @JsonKey(name: 'properties') @Default(<String, dynamic>{}) Map<String, dynamic> properties,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'destination') String? destination,
  }) = _ServiceRemoteInclusion;

  factory ServiceRemoteInclusion.fromJson(Map<String, dynamic> json) =>
      _$ServiceRemoteInclusionFromJson(json);
}
