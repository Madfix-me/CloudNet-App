part of cloudnetv3specapi;

class GroupsApi {
  final ApiClient apiClient;

  GroupsApi(ApiClient apiClient) : apiClient = apiClient;

  Future<List<GroupConfiguration>> getGroups() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams, path: baseUri.path + '/api/v2/group');
    final val = await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      print(response.data!);
      return GroupResponse.fromJson(response.data!).groups!;
    });

    return val;
  }
}
