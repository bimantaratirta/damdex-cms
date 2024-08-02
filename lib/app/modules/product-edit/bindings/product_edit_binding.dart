import 'package:get/get.dart';

import '../controllers/product_edit_controller.dart';

class ProductEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductEditController>(
      () => ProductEditController(),
    );
  }
}
