import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_get_usages.dart';

Future<APIResponse<ModelGetUsages>> getUsages() async {
  final param = APIParam<ModelGetUsages>(
    path: APIPath.usage,
    fromJson: ModelGetUsages.fromJson,
  );
  final response = await apiClient.get<ModelGetUsages>(param);
  return response;
}
