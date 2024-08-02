import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_toko_kota.dart';

Future<APIResponse<ModelTokoKota>> getTokoKota(String id) async {
  final param = APIParam<ModelTokoKota>(
    path: APIPath.tokoKotaId(id),
    fromJson: ModelTokoKota.fromJson,
  );
  final response = await apiClient.get<ModelTokoKota>(param);
  return response;
}
