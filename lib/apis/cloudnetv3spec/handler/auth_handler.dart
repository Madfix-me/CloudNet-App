part of cloudnetv3specapi;

class AuthApi {
  final ApiBasicClient apiClient;

  AuthApi(ApiBasicClient apiClient) : apiClient = apiClient;

  Future<AuthResponse> auth() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams, path:  '${baseUri.path}/auth');

    return await apiClient.dio.postUri<Json>(uri, data: {}).then((response) {
      print(response.data!);
      return AuthResponse.fromJson(response.data!);
    });
  }
}
