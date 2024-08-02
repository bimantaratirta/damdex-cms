import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_log.dart';

Future<APIResponse<ModelLog>> getLog(String id) async {
  final param = APIParam<ModelLog>(
    path: APIPath.articleId(id),
    fromJson: ModelLog.fromJson,
  );
  final response = await apiClient.get<ModelLog>(param);
  return response;
}
