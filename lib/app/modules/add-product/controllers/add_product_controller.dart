import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/product/data/post_product.dart';
import '../../../data/api/product/models/model_get_product.dart';
import '../../../routes/app_pages.dart';

class AddProductController extends GetxController {
  final Rx<ModelGetProduct> product = ModelGetProduct(listFitur: []).obs;
  final RxList<Feature> features = RxList<Feature>([]);

  final ScrollController scrollController = ScrollController();
  final HtmlEditorController editorController = HtmlEditorController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();

  final RxBool isError = false.obs;

  Future<void> submit() async {
    final response = await postProduct({
      "judul": product.value.judul,
      "deskripsi": await editorController.getText(),
      "idAsset": product.value.idAsset,
      "listFitur": features.map((feature) => feature.fitur.toJson()).toList()
    });
    if (response.data != null) {
      Get.toNamed(Routes.PRODUCT_DETAIL, arguments: response.data);
      isError.value = false;
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
  }
}

class Feature {
  final FocusNode focusNode;
  final TextEditingController textController;
  final HtmlEditorController editorController;
  final Fitur fitur;

  Feature({
    required this.focusNode,
    required this.textController,
    required this.editorController,
    required this.fitur,
  });
}
