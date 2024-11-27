import 'package:get/get.dart';

import '../controllers/add_video_controller.dart';

class AddVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddVideoController>(
      () => AddVideoController(),
    );
  }
}
