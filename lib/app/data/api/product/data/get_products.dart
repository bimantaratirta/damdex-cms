import '../../api_client.dart';
import '../../api_path.dart';
import '../models/model_get_produk.dart';

Future<APIResponse<ModelGetProduk>> getProducts() async {
  final param = APIParam<ModelGetProduk>(
    path: APIPath.product,
    fromJson: ModelGetProduk.fromJson,
  );
  final response = await apiClient.get<ModelGetProduk>(param);
  return response;
}
