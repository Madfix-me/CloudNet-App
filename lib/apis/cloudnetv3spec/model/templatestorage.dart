import 'package:freezed_annotation/freezed_annotation.dart';

part 'templatestorage.g.dart';

part 'templatestorage.freezed.dart';

@freezed
class TemplateStorage with _$TemplateStorage {
  const factory TemplateStorage({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'storages') @Default(<String>[]) List<String> storages,
  }) = _TemplateStorage;

  factory TemplateStorage.fromJson(Map<String, dynamic> json) =>
      _$TemplateStorageFromJson(json);
}
