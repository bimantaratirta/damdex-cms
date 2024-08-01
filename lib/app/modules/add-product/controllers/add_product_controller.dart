import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/product/models/model_get_product.dart';

class AddProductController extends GetxController {
  final Rx<ModelGetProduct> product = ModelGetProduct(listFitur: []).obs;

  final HtmlEditorController editorController = HtmlEditorController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();
}
