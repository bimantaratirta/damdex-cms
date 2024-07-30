import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    final _ = await adminValidate();
    super.onInit();
  }
}
