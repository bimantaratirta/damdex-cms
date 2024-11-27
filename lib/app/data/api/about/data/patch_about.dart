import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<dynamic>> patchAbout(Map<String, dynamic> data) async {
  final param = APIParam<dynamic>(
    path: APIPath.about,
    fromJson: (e) => e,
    data: data,
  );
  final response = await apiClient.patch<dynamic>(param);
  return response;
}
