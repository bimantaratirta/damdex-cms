import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_logs_header.dart';

Future<APIResponse<ModelLogsHeader>> getLogsHeader() async {
  final param = APIParam<ModelLogsHeader>(
    path: APIPath.userLogHeader,
    fromJson: ModelLogsHeader.fromJson,
  );
  final response = await apiClient.get<ModelLogsHeader>(param);
  return response;
}
