import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<Map<String, dynamic>>> adminLogout() async {
  final param = APIParam<Map<String, dynamic>>(path: APIPath.adminLogout, fromJson: (json) => json);
  final response = await apiClient.post<Map<String, dynamic>>(param);
  return response;
}
