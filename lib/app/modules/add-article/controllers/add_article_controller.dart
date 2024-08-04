import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/article/data/post_article.dart';
import '../../../data/api/article/model/model_article.dart';
import '../../../routes/app_pages.dart';

class AddArticleController extends GetxController {
  final Rx<ModelArticle> article = Rx<ModelArticle>(ModelArticle());

  final ScrollController scrollController = ScrollController();
  final HtmlEditorController editorController = HtmlEditorController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();

  final RxBool isLoading = false.obs;
  final RxBool isError = false.obs;

  Future<void> submit() async {
    isLoading.value = true;
    update();
    final response = await postArticle({
      "judul": article.value.judul,
      "body": await editorController.getText(),
      "idAsset": article.value.idAsset,
    });
    if (response.data != null) {
      Get.toNamed(Routes.ARTICLE_DETAIL, arguments: response.data);
      isError.value = false;
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
    isLoading.value = false;
    update();
  }
}
