import 'package:freezed_annotation/freezed_annotation.dart';

part 'process_configuration.g.dart';

part 'process_configuration.freezed.dart';

@freezed
class ProcessConfiguration with _$ProcessConfiguration {

  const factory ProcessConfiguration({
    @JsonKey(name: 'environment') String? environment,
    @JsonKey(name: 'maxHeapMemorySize') int? maxHeapMemorySize,
    @JsonKey(name: 'jvmOptions') List<String>? jvmOptions,
    @JsonKey(name: 'processParameters') List<String>? processParameters,
}) = _ProcessConfiguration;

  factory ProcessConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ProcessConfigurationFromJson(json);
}