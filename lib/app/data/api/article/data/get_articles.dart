import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_articles.dart';

Future<APIResponse<ModelArticles>> getArticles() async {
  final param = APIParam<ModelArticles>(
    path: APIPath.article,
    fromJson: ModelArticles.fromJson,
  );
  final response = await apiClient.get<ModelArticles>(param);
  return response;
}
