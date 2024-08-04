import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_settings.dart';

Future<APIResponse<ModelSettings>> getSettings() async {
  final param = APIParam<ModelSettings>(
    path: APIPath.settings,
    fromJson: ModelSettings.fromJson,
  );
  final response = await apiClient.get<ModelSettings>(param);
  return response;
}
