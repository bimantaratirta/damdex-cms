import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<String>> postProduct(Map<String, dynamic> data) async {
  final param = APIParam<String>(
    path: APIPath.product,
    fromJson: (e) => e["id"],
    data: data,
  );
  final response = await apiClient.post<String>(param);
  return response;
}
