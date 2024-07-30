import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<Map<String, dynamic>>> adminValidate() async {
  final param = APIParam<Map<String, dynamic>>(path: APIPath.adminValidate, fromJson: (json) => json);
  final response = await apiClient.get<Map<String, dynamic>>(param);
  return response;
}
