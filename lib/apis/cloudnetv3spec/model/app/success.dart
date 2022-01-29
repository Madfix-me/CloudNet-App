import 'package:freezed_annotation/freezed_annotation.dart';

part 'success.freezed.dart';
part 'success.g.dart';

@freezed
class Success with _$Success {
  const factory Success({
    @JsonKey(name: 'success') @Default(false) bool success,
    @JsonKey(name: 'reason') String? reason,
  }) = _Success;

  factory Success.fromJson(Map<String, dynamic> json) =>
      _$SuccessFromJson(json);
}
