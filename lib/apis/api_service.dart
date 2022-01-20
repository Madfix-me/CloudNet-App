import '/apis/cloudnetv3spec/cloudnetv3specapi.dart';
import '/feature/login/login_handler.dart';
import '/feature/node/node_handler.dart';
import 'api_client.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();
  factory ApiService() => _apiService;
  ApiService._internal();

  late final ApiClient _apiClient = _createApiClient();

  late final NodeApi nodeApi = NodeApi(_apiClient);
  late final TasksApi tasksApi = TasksApi(_apiClient);
  late final GroupsApi groupsApi = GroupsApi(_apiClient);
  late final VersionsApi versionsApi = VersionsApi(_apiClient);
  late final TemplateStorageApi templateStorageApi =
      TemplateStorageApi(_apiClient);
  late final TemplateApi templateApi = TemplateApi(_apiClient);

  ApiClient _createApiClient() {
    return ApiClient(nodeHandler.currentBaseUrl(), loginHandler.accessToken);
  }
}
