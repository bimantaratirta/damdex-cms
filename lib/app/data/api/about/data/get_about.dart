import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_about.dart';

Future<APIResponse<ModelAbout>> getAbout() async {
  final param = APIParam<ModelAbout>(
    path: APIPath.about,
    fromJson: ModelAbout.fromJson,
  );
  final response = await apiClient.get<ModelAbout>(param);
  return response;
}
