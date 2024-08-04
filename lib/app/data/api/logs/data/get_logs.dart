import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_logs.dart';

Future<APIResponse<ModelLogs>> getLogs() async {
  final param = APIParam<ModelLogs>(
    path: APIPath.userLog,
    fromJson: ModelLogs.fromJson,
  );
  final response = await apiClient.get<ModelLogs>(param);
  return response;
}
