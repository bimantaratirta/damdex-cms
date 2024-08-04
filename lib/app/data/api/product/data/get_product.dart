import '../../api_client.dart';
import '../../api_path.dart';
import '../models/model_get_product.dart';

Future<APIResponse<ModelGetProduct>> getProduct(String id) async {
  final param = APIParam<ModelGetProduct>(
    path: APIPath.productId(id),
    fromJson: ModelGetProduct.fromJson,
  );
  final response = await apiClient.get<ModelGetProduct>(param);
  return response;
}
