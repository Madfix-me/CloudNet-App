part of cloudnetv3specapi;

class TemplateApi {
  final ApiClient apiClient;

  TemplateApi(ApiClient apiClient) : apiClient = apiClient;

  Future<Success> create(String storage, String prefix, String name) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams,
        path: baseUri.path + '/api/v2/template/$storage/$prefix/$name/create');
    final val = await apiClient.dio.getUri(uri).then((response) {
      return Success.fromJson(response.data!);
    });

    return val;
  }

  Future<Success> install(TemplateInstall templateInstall, String storage,
      String prefix, String name) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams,
        path: baseUri.path + '/api/v2/template/$storage/$prefix/$name/install');
    final val = await apiClient.dio
        .postUri(uri, data: templateInstall)
        .then((response) {
      return Success.fromJson(response.data!);
    });

    return val;
  }
}
