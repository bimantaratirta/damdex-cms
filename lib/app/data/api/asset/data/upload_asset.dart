import 'package:dio/dio.dart';

import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<String>> uploadAsset({required List<int>? bytes, required String fileName}) async {
  FormData formData = FormData.fromMap({
    "file": MultipartFile.fromBytes(bytes ?? [], filename: fileName),
  });
  final param = APIParam<String>(
    path: APIPath.asset,
    fromJson: (json) => json["id"],
    formData: formData,
  );
  final response = await apiClient.post<String>(param);
  return response;
}
