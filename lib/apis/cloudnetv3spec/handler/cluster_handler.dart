part of cloudnetv3specapi;

class ClusterApi {
  final ApiClient apiClient;

  ClusterApi(ApiClient apiClient) : apiClient = apiClient;

  Future<ClusterNodesResponse> getNodes() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams, path: baseUri.path + '/api/v2/cluster');
    final val = await apiClient.dio.getUri(uri).then((response) {
      return ClusterNodesResponse.fromJson(response.data!);
    });

    return val;
  }
}
