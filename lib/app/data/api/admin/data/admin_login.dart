import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<Map<String, dynamic>>> login({required String username, required String password}) async {
  final payload = {"username": username, "password": password};
  final param = APIParam<Map<String, dynamic>>(
    path: APIPath.adminLogin,
    fromJson: (json) => json,
    data: payload,
  );
  final response = await apiClient.post<Map<String, dynamic>>(param);
  return response;
}
