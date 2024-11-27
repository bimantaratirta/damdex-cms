import 'package:get/get.dart';

import '../controllers/syarat_ketentuan_controller.dart';

class SyaratKetentuanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SyaratKetentuanController>(SyaratKetentuanController());
  }
}
