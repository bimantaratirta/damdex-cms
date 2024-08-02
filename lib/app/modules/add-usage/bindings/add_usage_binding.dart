import 'package:get/get.dart';

import '../controllers/add_usage_controller.dart';

class AddUsageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUsageController>(
      () => AddUsageController(),
    );
  }
}
