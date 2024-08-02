import 'package:get/get.dart';

import '../controllers/log_detail_controller.dart';

class LogDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogDetailController>(
      () => LogDetailController(),
    );
  }
}
