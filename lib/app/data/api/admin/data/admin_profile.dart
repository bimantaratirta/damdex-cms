import '../../api_client.dart';
import '../../api_path.dart';
import '../models/admin_profile.dart';

Future<APIResponse<ModelAdminProfile>> adminProfile() async {
  final param = APIParam<ModelAdminProfile>(
    path: APIPath.adminProfile,
    fromJson: ModelAdminProfile.fromJson,
  );
  final response = await apiClient.get<ModelAdminProfile>(param);
  return response;
}
