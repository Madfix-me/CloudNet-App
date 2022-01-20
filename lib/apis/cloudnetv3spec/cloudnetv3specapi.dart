library cloudnetv3specapi;

import '/apis/api_client.dart';

//import '/apis/cloudnetv3spec/model/cloudnet_version.dart';
//import '/apis/cloudnetv3spec/model/host_and_port.dart';
//import '/apis/cloudnetv3spec/model/network_cluster_node.dart';
//import '/apis/cloudnetv3spec/model/network_cluster_node_info_snapshot.dart';
import '/apis/cloudnetv3spec/model/node_info.dart';
import '/apis/cloudnetv3spec/model/service_task.dart';
import '/apis/cloudnetv3spec/model/task_response.dart';
import '/apis/cloudnetv3spec/model/group_response.dart';
import '/apis/cloudnetv3spec/model/group_configuration.dart';
//import '/apis/cloudnetv3spec/model/service_version.dart';
import '/apis/cloudnetv3spec/model/service_version_type.dart';
import '/apis/cloudnetv3spec/model/success.dart';
import '/apis/cloudnetv3spec/model/service_version_type_response.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/templatestorage.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/templatestorage_response.dart';
import 'package:cloudnet/apis/cloudnetv3spec/model/template_install.dart';
import '/apis/cloudnetv3spec/model/service_template.dart';
// import '/apis/cloudnetv3spec/model/version.dart';
// import '/apis/cloudnetv3spec/model/ticket_response.dart';
//import '/apis/cloudnetv3spec/model/service_deployment.dart';
//import '/apis/cloudnetv3spec/model/service_remote_inclusion.dart';
//import '/apis/cloudnetv3spec/model/process_configuration.dart';

part 'handler/node_handler.dart';
part 'handler/tasks_handler.dart';
part 'handler/group_handler.dart';
part 'handler/version_handler.dart';
part 'handler/templatestorage_handler.dart';
part 'handler/template_handler.dart';

typedef Json = Map<String, dynamic>;