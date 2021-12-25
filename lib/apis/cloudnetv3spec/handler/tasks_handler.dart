part of cloudnetv3specapi;

class TasksApi {
  final ApiClient apiClient;

  TasksApi(ApiClient apiClient) : apiClient = apiClient;

  Future<List<ServiceTask>> getTasks() async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams, path: baseUri.path + '/api/v2/task');
    final val = await apiClient.dio
        .getUri(
      uri,
    )
        .then((response) {
      return TaskResponse.fromJson(response.data!).tasks!;
    });

    return val;
  }

  Future<Success> createTask(ServiceTask task) async {
    final queryParams = <String, dynamic>{};

    final baseUri = Uri.parse(apiClient.baseUrl);
    final uri = baseUri.replace(
        queryParameters: queryParams, path: baseUri.path + '/api/v2/task');
    final val =
        await apiClient.dio.postUri<Json>(uri, data: task).then((response) {
      return Success.fromJson(response.data!);
    });

    return val;
  }
}
