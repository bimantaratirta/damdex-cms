import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ProductEditController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final HtmlEditorController editorController = HtmlEditorController();
  final TextEditingController nameC = TextEditingController(text: "Nama Produk 1");
  final FocusNode nameFN = FocusNode();

  RxList<int> features = [1, 2, 3].obs;
}
