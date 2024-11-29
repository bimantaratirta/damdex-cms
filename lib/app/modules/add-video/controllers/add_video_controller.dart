import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/videos/data/post_video.dart';
import '../../../data/api/videos/model/model_video.dart';
import '../../../routes/app_pages.dart';

class AddVideoController extends GetxController {
  final Rx<Video> video = Rx<Video>(Video());

  final ScrollController scrollController = ScrollController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController urlC = TextEditingController();
  final TextEditingController indexC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final FocusNode urlFN = FocusNode();
  final FocusNode indexFN = FocusNode();

  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;
  final RxBool isNaN = false.obs;

  Future<void> submit() async {
    isLoading.value = true;
    update();
    final response = await postVideo({
      "index": video.value.index,
      "judul": video.value.judul,
      "url": video.value.url,
      "idAsset": video.value.idAsset,
    });
    if (response.data != null) {
      Get.toNamed(Routes.VIDEO_DETAIL, arguments: response.data);
      isError.value = false;
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
    isLoading.value = false;
    update();
  }
}
