import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../../data/api/videos/data/delete_video.dart';
import '../../../data/api/videos/data/get_video.dart';
import '../../../data/api/videos/data/patch_video.dart';
import '../../../data/api/videos/model/model_video.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/check_youtube_link.dart';

class VideoDetailController extends GetxController {
  final Rx<Video?> video = Rx<Video?>(null);

  final ScrollController scrollController = ScrollController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController urlC = TextEditingController();
  final TextEditingController indexC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final FocusNode urlFN = FocusNode();
  final FocusNode indexFN = FocusNode();

  RxBool isOnEdit = false.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool isHidden = false.obs;
  RxBool isNotYouTubeLink = false.obs;
  RxBool isNaN = false.obs;

  Future<void> patch() async {
    isNotYouTubeLink.value = false;
    if (!isValidYouTubeLink(urlC.text)) {
      isNotYouTubeLink.value = true;
      return;
    }
    isLoading.value = true;
    update();
    final response = await patchVideo(
      video.value?.id ?? "",
      {
        "index": video.value?.index,
        "judul": video.value?.judul,
        "url": video.value?.url,
        "idAsset": video.value?.idAsset,
      },
    );
    final sc = response.statusCode ?? 0;
    if (sc >= 200 && sc < 300) {
      isOnEdit.value = false;
      final response = await getVideo(Get.arguments ?? "");
      if (response.data != null) {
        video.value = response.data;
        nameC.text = response.data?.judul ?? "";
        urlC.text = response.data?.url ?? "";
        indexC.text = response.data?.index.toString() ?? "0";
      }
      isError.value = false;
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
    isLoading.value = false;
    update();
  }

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    update();
    final response = await getVideo(Get.arguments ?? "null");
    if (response.data != null) {
      video.value = response.data;
      nameC.text = response.data?.judul ?? "";
      urlC.text = response.data?.url ?? "";
      indexC.text = response.data?.index.toString() ?? "0";
    } else {
      Get.offNamed(Routes.VIDEOS);
    }
    isLoading.value = false;
    update();
    super.onInit();
  }

  Future<void> delete() async {
    final video = this.video.value;
    isHidden.value = true;
    update();
    await Get.dialog(PointerInterceptor(
      child: AlertDialog(
        title: Text("Hapus Video ${video?.judul}?"),
        actions: [
          AppButton(
            type: ButtonType.outlined,
            onPressed: Get.back,
            fixedSize: const Size(100, 40),
            child: const Text("Batal"),
          ),
          AppButton(
            type: ButtonType.elevated,
            backgroundColor: AppColors.red,
            onPressed: () {
              deleteVideo(video?.id ?? "").then((res) {
                Get.offAllNamed(Routes.VIDEOS);
              });
            },
            fixedSize: const Size(100, 40),
            child: const Text("Hapus"),
          ),
        ],
      ),
    ));
    isHidden.value = false;
    update();
  }
}
