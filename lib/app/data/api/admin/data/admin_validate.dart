import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<dynamic>> adminValidate() async {
  final param = APIParam<dynamic>(path: APIPath.adminValidate, fromJson: (json) => json);
  final response = await apiClient.get<dynamic>(param);
  return response;
}
