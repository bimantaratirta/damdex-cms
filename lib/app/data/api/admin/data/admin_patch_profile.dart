import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<dynamic>> adminPatchProfile(Map<String, dynamic> data) async {
  final param = APIParam<dynamic>(
    path: APIPath.adminProfile,
    fromJson: (e) => e,
    data: data,
  );
  final response = await apiClient.patch<dynamic>(param);
  return response;
}
