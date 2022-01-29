library cloudnetv3specapi;

import '/apis/api_client.dart';

import 'model/cloudnet/node_info.dart';
import 'model/cloudnet/service_task.dart';
import 'model/cloudnet/task_response.dart';
import 'model/app/response/group_response.dart';
import 'model/cloudnet/group_configuration.dart';
import 'model/cloudnet/service_version_type.dart';
import 'model/app/success.dart';
import 'model/app/response/service_version_type_response.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/templatestorage.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/app/response/templatestorage_response.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/cloudnet/template_install.dart';
import 'model/cloudnet/service_template.dart';


part 'handler/node_handler.dart';
part 'handler/tasks_handler.dart';
part 'handler/group_handler.dart';
part 'handler/version_handler.dart';
part 'handler/templatestorage_handler.dart';
part 'handler/template_handler.dart';

typedef Json = Map<String, dynamic>;
