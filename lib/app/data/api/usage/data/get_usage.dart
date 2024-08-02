import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_usage.dart';

Future<APIResponse<ModelUsage>> getUsage(String id) async {
  final param = APIParam<ModelUsage>(
    path: APIPath.usageId(id),
    fromJson: ModelUsage.fromJson,
  );
  final response = await apiClient.get<ModelUsage>(param);
  return response;
}
