import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_login.dart';
import '../../../data/api/admin/data/admin_validate.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/hash_string.dart';
import '../../../shareds/widgets/app_button.dart';

class LoginController extends GetxController {
  TextEditingController usernameC = TextEditingController();
  TextEditingController passC = TextEditingController();
  FocusNode usernameFN = FocusNode();
  FocusNode passFN = FocusNode();

  RxBool isError = false.obs;
  RxBool isLoading = false.obs;
  Rx<ButtonState> buttonState = ButtonState.enable.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    final response = await adminValidate();
    if (response.statusCode == 200) {
      Get.offAllNamed(Routes.PRODUCT);
    }
    isLoading.value = false;
    super.onInit();
  }

  Future<void> onSubmitLogin() async {
    buttonState.value = ButtonState.loading;
    isError.value = false;
    final response = await login(username: "admin", password: hashString("password"));
    if (response.statusCode == 200) {
      buttonState.value = ButtonState.disable;
      Get.offAllNamed(Routes.PRODUCT);
    } else {
      isError.value = true;
    }
  }
}
