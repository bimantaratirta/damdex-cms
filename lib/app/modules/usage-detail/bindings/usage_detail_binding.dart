import 'package:get/get.dart';

import '../controllers/usage_detail_controller.dart';

class UsageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsageDetailController>(
      () => UsageDetailController(),
    );
  }
}
