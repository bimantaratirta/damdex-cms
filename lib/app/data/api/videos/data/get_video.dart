import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_video.dart';

Future<APIResponse<Video>> getVideo(String id) async {
  final param = APIParam<Video>(
    path: APIPath.videoId(id),
    fromJson: Video.fromJson,
  );
  final response = await apiClient.get<Video>(param);
  return response;
}
