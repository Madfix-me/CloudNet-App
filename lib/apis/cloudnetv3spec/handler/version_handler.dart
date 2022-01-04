part of cloudnetv3specapi;

class VersionsApi {
  final ApiClient apiClient;

  VersionsApi(ApiClient apiClient) : apiClient = apiClient;

  Future<List<ServiceVersionType>> getVersions() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams,
        path: baseUri.path + '/api/v2/serviceversion');
    final val = await apiClient.dio.getUri(uri).then((response) {
      return ServiceVersionTypeResponse.fromJson(response.data!)
          .versions!
          .values
          .toList();
    });

    return val;
  }
}
