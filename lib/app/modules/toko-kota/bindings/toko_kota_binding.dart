import 'package:get/get.dart';

import '../controllers/toko_kota_controller.dart';

class TokoKotaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TokoKotaController>(
      () => TokoKotaController(),
    );
  }
}
