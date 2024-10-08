import 'package:get/get.dart';

import '../controllers/newversion_apk_controller.dart';

class NewversionApkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewversionApkController>(NewversionApkController());
  }
}
