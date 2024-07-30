import 'package:get/get.dart';

import '../controllers/artcle_detail_controller.dart';

class ArtcleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtcleDetailController>(
      () => ArtcleDetailController(),
    );
  }
}
