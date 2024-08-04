import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<String>> postUsage(Map<String, dynamic> data) async {
  final param = APIParam<String>(
    path: APIPath.usage,
    fromJson: (e) {
      return e["id"];
    },
    data: data,
  );
  final response = await apiClient.post<String>(param);
  return response;
}
