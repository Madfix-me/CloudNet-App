import 'package:freezed_annotation/freezed_annotation.dart';

part 'module_repository.freezed.dart';
part 'module_repository.g.dart';

@freezed
class ModuleRepository with _$ModuleRepository {
  const factory ModuleRepository({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'url') String? url,
  }) = _ModuleRepository;

  factory ModuleRepository.fromJson(Map<String, dynamic> json) =>
      _$ModuleRepositoryFromJson(json);
}
