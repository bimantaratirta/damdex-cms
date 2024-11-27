import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/about/data/get_about.dart';
import '../../../data/api/about/data/patch_about.dart';
import '../../../data/api/about/model/model_about.dart';

class AboutController extends GetxController {
  final Rx<ModelAbout?> article = Rx<ModelAbout?>(null);

  final ScrollController scrollController = ScrollController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final HtmlEditorController editorController = HtmlEditorController();

  RxBool isOnEdit = false.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool isHidden = false.obs;

  Future<void> patch() async {
    isLoading.value = true;
    update();
    final response = await patchAbout(
      {
        "judul": article.value?.judul,
        "body": await editorController.getText(),
        "idAsset": article.value?.idAsset,
      },
    );
    final sc = response.statusCode ?? 0;
    if (sc >= 200 && sc < 300) {
      isOnEdit.value = false;
      final response = await getAbout();
      if (response.data != null) {
        article.value = response.data;
        nameC.text = response.data?.judul ?? "";
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
    final response = await getAbout();
    if (response.data != null) {
      article.value = response.data;
      nameC.text = response.data?.judul ?? "";
    }
    isLoading.value = false;
    update();
    super.onInit();
  }
}
