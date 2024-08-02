import '../../api_client.dart';
import '../../api_path.dart';
import '../models/model_get_products.dart';

Future<APIResponse<ModelGetProducts>> getProducts() async {
  final param = APIParam<ModelGetProducts>(
    path: APIPath.product,
    fromJson: ModelGetProducts.fromJson,
  );
  final response = await apiClient.get<ModelGetProducts>(param);
  return response;
}
