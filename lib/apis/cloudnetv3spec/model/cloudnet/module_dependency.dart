import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_dependency.g.dart';

part 'module_dependency.freezed.dart';

@freezed
class ModuleDependency with _$ModuleDependency {

  const factory ModuleDependency({
    @JsonKey(name: 'repo') String? repo,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'group') String? group,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'version') String? version,
}) = _ModuleDependency;


  factory ModuleDependency.fromJson(Map<String, dynamic> json) =>
      _$ModuleDependencyFromJson(json);

}
