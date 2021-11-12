import 'package:cloudnet_v3_flutter/apis/cloudnetv3spec/cloudnetv3specapi.dart';
import 'package:cloudnet_v3_flutter/feature/login/login_handler.dart';
import 'package:cloudnet_v3_flutter/feature/node/node_handler.dart';
import 'api_client.dart';

class ApiService {
  static final ApiService _apiService = ApiService._internal();
  factory ApiService() => _apiService;
  ApiService._internal();

  late final ApiClient _apiClient = _createApiClient();
  late final ApiBasicClient _apiBasicClient = _createBasicApiClient();

  late final NodeApi nodeApi = NodeApi(_apiClient);
  late final AuthApi authApi = AuthApi(_apiBasicClient);

  ApiClient _createApiClient() {
    return ApiClient(nodeHandler.currentBaseUrl(), loginHandler.accessToken);
  }

  ApiBasicClient _createBasicApiClient() {
    return ApiBasicClient(nodeHandler.currentBaseUrl(), loginHandler.basicAuth);
  }
}
