import '../../api_client.dart';
import '../../api_path.dart';

Future<APIResponse<dynamic>> deleteProduct(String id) async {
  final param = APIParam<dynamic>(
    path: APIPath.productId(id),
    fromJson: (e) => e,
  );
  final response = await apiClient.delete<dynamic>(param);
  return response;
}
