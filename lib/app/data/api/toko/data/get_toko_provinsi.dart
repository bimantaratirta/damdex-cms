import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_toko_provinsi.dart';

Future<APIResponse<ModelTokoProvinsi>> getTokoProvinsi() async {
  final param = APIParam<ModelTokoProvinsi>(
    path: APIPath.tokoProvinsi,
    fromJson: ModelTokoProvinsi.fromJson,
  );
  final response = await apiClient.get<ModelTokoProvinsi>(param);
  return response;
}
