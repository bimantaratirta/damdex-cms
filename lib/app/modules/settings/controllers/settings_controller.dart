import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_patch_profile.dart';
import '../../../data/api/admin/data/admin_profile.dart';
import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/admin/models/admin_profile.dart';
import '../../../data/api/settings/data/get_settings.dart';
import '../../../data/api/settings/model/model_settings.dart';
import '../../../utils/hash_string.dart';

class SettingsController extends GetxController {
  Rx<ModelSettings?> settings = Rx<ModelSettings?>(null);
  Rx<ModelAdminProfile?> profile = Rx<ModelAdminProfile?>(null);

  final TextEditingController namaC = TextEditingController();
  final TextEditingController unameC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController conPassC = TextEditingController();
  final FocusNode namaFN = FocusNode();
  final FocusNode unameFN = FocusNode();
  final FocusNode passFN = FocusNode();
  final FocusNode conPassFN = FocusNode();

  RxBool isOnEdit = false.obs;
  RxBool isError = false.obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    await adminValidate().then((res) async {
      if (res.statusCode == 200) {
        getSettings().then((res) {
          if (res.data != null) {
            settings.value = res.data;
          }
        });
        adminProfile().then((res) {
          if (res.data != null) {
            profile.value = res.data;
            namaC.text = res.data?.nama ?? "";
            unameC.text = res.data?.username ?? "";
          }
        });
      }
    });
    super.onInit();
  }

  Future<void> patch() async {
    isLoading.value = true;
    isError.value = false;
    final param = {
      "nama": namaC.text,
      "username": unameC.text,
    };
    if (passC.text.isNotEmpty && conPassC.text.isNotEmpty) {
      param["currentPassword"] = hashString(passC.text);
      param["newPassword"] = hashString(conPassC.text);
    }
    final response = await adminPatchProfile(param);
    if (response.data != null) {
      onInit();
      isOnEdit.value = false;
    } else {
      isError.value = true;
    }
    isLoading.value = false;
  }
}
