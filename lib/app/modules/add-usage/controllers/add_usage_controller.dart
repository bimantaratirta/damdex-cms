import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/usage/data/post_usage.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../routes/app_pages.dart';

class AddUsageController extends GetxController {
  final Rx<ModelUsage> usage = Rx<ModelUsage>(ModelUsage(listArtikel: [], listTipe: []));
  final RxList<UsageType> types = RxList<UsageType>([]);

  final ScrollController scrollController = ScrollController();
  final HtmlEditorController editorController = HtmlEditorController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();

  final RxBool isError = false.obs;

  Future<void> submit() async {
    final usage = this.usage.value;
    final response = await postUsage({
      "judul": usage.judul,
      "deskripsi": await editorController.getText(),
      "idAsset": usage.idAsset,
      "listTipe": types.map((type) => type.tipe.toJson()).toList(),
      "listArtikel": usage.listArtikel?.map((article) {
        return {"index": usage.listArtikel?.indexOf(article), "idArtikel": article.id};
      }).toList()
    });
    if (response.data != null) {
      Get.toNamed(Routes.USAGE_DETAIL, arguments: response.data);
      isError.value = false;
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
  }
}

class UsageType {
  final FocusNode focusNode;
  final TextEditingController textController;
  final HtmlEditorController editorController;
  final Tipe tipe;

  UsageType({
    required this.focusNode,
    required this.textController,
    required this.editorController,
    required this.tipe,
  });
}
