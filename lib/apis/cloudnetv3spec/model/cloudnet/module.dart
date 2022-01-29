import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/module_dependency.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/module_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'module.freezed.dart';
part 'module.g.dart';

@freezed
class Module with _$Module {

  const factory Module({
    @JsonKey(name: 'runtimeModule') bool? runtimeModule,
    @JsonKey(name: 'storesSensitiveData') bool? storesSensitiveData,
    @JsonKey(name: 'group') String? group,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'version') String? version,
    @JsonKey(name: 'main') String? main,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'website') String? website,
    @JsonKey(name: 'dataFolder') String? dataFolder,
    @JsonKey(name: 'repositories')@Default(<ModuleRepository>[])List<ModuleRepository> repositories,
    @JsonKey(name: 'dependencies') @Default(<ModuleDependency>[])List<ModuleDependency> dependencies,
    @JsonKey(name: 'minJavaVersionId') int? minJavaVersionId,
    @JsonKey(name: 'properties') @Default(<String, dynamic>{}) Map<String,dynamic> properties,
}) = _Module;


  factory Module.fromJson(Map<String, dynamic> json) => _$ModuleFromJson(json);
}
