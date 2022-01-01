part of cloudnetv3specapi;

class TemplateStorageApi {
  final ApiClient apiClient;

  TemplateStorageApi(ApiClient apiClient) : apiClient = apiClient;

  Future<TemplateStorage> getStorage() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams, path: baseUri.path + '/api/v2/templatestorage');
    final val = await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      return TemplateStorage.fromJson(response.data!);
    });

    return val;
  }
  Future<List<ServiceTemplate>> getTemplates(String storage) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams, path: baseUri.path + '/api/v2/templatestorage/$storage/templates');
    final val = await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      return TemplateStorageResponse.fromJson(response.data!).templates;
    });

    return val;
  }
}
