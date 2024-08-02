import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<dynamic>> patchArticle(String id, Map<String, dynamic> data) async {
  final param = APIParam<dynamic>(
    path: APIPath.articleId(id),
    fromJson: (e) => e,
    data: data,
  );
  final response = await apiClient.patch<dynamic>(param);
  return response;
}
