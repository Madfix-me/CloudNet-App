import 'package:cloudnet/apis/cloudnetv3spec/model/group_configuration.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_task.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/service_version_type.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/templatestorage.dart';

import '/apis/cloudnetv3spec/model/node_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    NodeInfo? nodeInfo,
    List<ServiceTask>? tasks,
    List<GroupConfiguration>? groups,
    List<ServiceVersionType>? versions,
    TemplateStorage? templateStorage,
    String? token,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
