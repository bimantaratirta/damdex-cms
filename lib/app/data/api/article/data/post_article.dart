import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<String>> postArticle(Map<String, dynamic> data) async {
  final param = APIParam<String>(
    path: APIPath.article,
    fromJson: (e) => e["id"],
    data: data,
  );
  final response = await apiClient.post<String>(param);
  return response;
}
