import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_videos.dart';

Future<APIResponse<Videos>> getVideos() async {
  final param = APIParam<Videos>(
    path: APIPath.video,
    fromJson: Videos.fromJson,
  );
  final response = await apiClient.get<Videos>(param);
  return response;
}
