import 'package:get/get.dart';

import '../controllers/add_article_controller.dart';

class AddArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddArticleController>(
      () => AddArticleController(),
    );
  }
}
