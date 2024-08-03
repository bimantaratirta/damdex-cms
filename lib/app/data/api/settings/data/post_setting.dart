import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<String>> postSetting(Map<String, dynamic> data) async {
  final param = APIParam<String>(
    path: APIPath.settings,
    fromJson: (e) => e["id"],
    data: data,
  );
  final response = await apiClient.post<String>(param);
  return response;
}
