part of cloudnetv3specapi;

class NodeApi {
  final ApiClient apiClient;

  NodeApi(ApiClient apiClient) : apiClient = apiClient;

  Future<NodeInfo> getNode() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(queryParameters: queryParams, path: baseUri.path + '/api/v2/node');
    final val = await apiClient.dio.getUri(uri).then((response) {
      return NodeInfo.fromJson(response.data);
    });
    return val;
  }
}
