import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_article.dart';

Future<APIResponse<ModelArticle>> getArticle(String id) async {
  final param = APIParam<ModelArticle>(
    path: APIPath.articleId(id),
    fromJson: ModelArticle.fromJson,
  );
  final response = await apiClient.get<ModelArticle>(param);
  return response;
}
