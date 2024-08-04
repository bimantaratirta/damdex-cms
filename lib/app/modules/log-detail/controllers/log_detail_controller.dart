import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/api/logs/data/get_log.dart';
import '../../../data/api/logs/model/model_log.dart';
import '../../../routes/app_pages.dart';

class LogDetailController extends GetxController {
  final Rx<ModelLog?> log = Rx<ModelLog?>(null);

  final ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    final response = await getLog(Get.arguments ?? "null");
    if (response.data != null) {
      log.value = response.data;
    } else {
      Get.offNamed(Routes.LOGS);
    }
    update();
    super.onInit();
  }
}
