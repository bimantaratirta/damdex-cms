import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../../data/api/article/data/delete_article.dart';
import '../../../data/api/article/data/get_article.dart';
import '../../../data/api/article/data/patch_article.dart';
import '../../../data/api/article/model/model_article.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../theme/app_colors.dart';

class ArticleDetailController extends GetxController {
  final Rx<ModelArticle?> article = Rx<ModelArticle?>(null);

  final ScrollController scrollController = ScrollController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController indexC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final FocusNode indexFN = FocusNode();
  final HtmlEditorController editorController = HtmlEditorController();

  RxBool isOnEdit = false.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  RxBool isHidden = false.obs;
  RxBool isNaN = false.obs;

  Future<void> patch() async {
    isLoading.value = true;
    update();
    final response = await patchArticle(
      article.value?.id ?? "",
      {
        "index": article.value?.index,
        "judul": article.value?.judul,
        "body": await editorController.getText(),
        "idAsset": article.value?.idAsset,
      },
    );
    final sc = response.statusCode ?? 0;
    if (sc >= 200 && sc < 300) {
      isOnEdit.value = false;
      final response = await getArticle(Get.arguments ?? "");
      if (response.data != null) {
        article.value = response.data;
        nameC.text = response.data?.judul ?? "";
        indexC.text = response.data?.index.toString() ?? "";
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
    final response = await getArticle(Get.arguments ?? "null");
    if (response.data != null) {
      article.value = response.data;
      nameC.text = response.data?.judul ?? "";
      indexC.text = response.data?.index.toString() ?? "";
    } else {
      Get.offNamed(Routes.ARTICLE);
    }
    isLoading.value = false;
    update();
    super.onInit();
  }

  Future<void> delete() async {
    final article = this.article.value;
    Get.dialog(PointerInterceptor(
      child: AlertDialog(
        title: Text("Hapus Artikel ${article?.judul}?"),
        actions: [
          b.AppButton(
            type: b.ButtonType.outlined,
            onPressed: Get.back,
            fixedSize: const Size(100, 40),
            child: const Text("Batal"),
          ),
          b.AppButton(
            type: b.ButtonType.elevated,
            backgroundColor: AppColors.red,
            onPressed: () {
              deleteArticle(article?.id ?? "").then((res) {
                Get.offAllNamed(Routes.ARTICLE);
              });
            },
            fixedSize: const Size(100, 40),
            child: const Text("Hapus"),
          ),
        ],
      ),
    ));
  }
}
