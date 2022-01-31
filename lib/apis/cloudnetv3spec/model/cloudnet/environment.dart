import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment.freezed.dart';
part 'environment.g.dart';

@freezed
class Environment with _$Environment {
  const factory Environment({
    @JsonKey(name: 'properties')
    @Default(<String, dynamic>{})
        Map<String, dynamic> properties,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'defaultServiceStartPort') int? defaultServiceStartPort,
    @JsonKey(name: 'defaultProcessArguments')
    @Default(<String>[])
        List<String> defaultProcessArguments,
  }) = _Environment;

  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);
}
