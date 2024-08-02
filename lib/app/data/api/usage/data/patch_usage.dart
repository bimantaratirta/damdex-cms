import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<dynamic>> patchUsage(String id, Map<String, dynamic> data) async {
  final param = APIParam<dynamic>(
    path: APIPath.usageId(id),
    fromJson: (e) => e,
    data: data,
  );
  final response = await apiClient.patch<dynamic>(param);
  return response;
}
