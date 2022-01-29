import 'package:freezed_annotation/freezed_annotation.dart';

part 'thread.g.dart';
part 'thread.freezed.dart';

@freezed
class Thread with _$Thread {

  const factory Thread({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'priority') int? priority,
    @JsonKey(name: 'daemon') bool? daemon,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'threadState') String? threadState,
}) = _Thread;

  factory Thread.fromJson(Map<String, dynamic> json) => _$ThreadFromJson(json);
}
