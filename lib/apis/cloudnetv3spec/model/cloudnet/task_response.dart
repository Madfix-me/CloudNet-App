import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/service_task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_response.freezed.dart';

part 'task_response.g.dart';

@freezed
class TaskResponse with _$TaskResponse {
  const factory TaskResponse({
    @JsonKey(name: 'success') bool? success,
    @JsonKey(name: 'tasks') @Default(<ServiceTask>[]) List<ServiceTask> tasks,
  }) = _TaskResponse;

  factory TaskResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseFromJson(json);
}
