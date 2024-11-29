import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/article/data/get_articles.dart';
import '../../../data/api/article/model/model_article.dart';
import '../../../data/api/article/model/model_articles.dart';
import '../../../data/api/usage/data/post_usage.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../routes/app_pages.dart';

class AddUsageController extends GetxController {
  final Rx<ModelUsage> usage = Rx<ModelUsage>(ModelUsage(listArtikel: [], listTipe: []));
  final Rx<ModelArticles> articles = Rx<ModelArticles>(ModelArticles(totalAllData: 0, payload: []));
  final RxList<ModelArticle> searchedList = RxList<ModelArticle>([]);
  final RxList<UsageType> types = RxList<UsageType>([]);
  final Rx<ModelArticle?> selectedArticle = Rx<ModelArticle?>(null);

  final ScrollController scrollController = ScrollController();
  final HtmlEditorController editorController = HtmlEditorController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();

  Rx<UsageType?> seletedType = Rx<UsageType?>(null);
  RxBool isLoading = false.obs;
  RxBool isOnDialog = false.obs;
  final RxBool isError = false.obs;

  Future<void> submit() async {
    isLoading.value = true;
    update();
    final usage = this.usage.value;
    final response = await postUsage({
      "judul": usage.judul,
      "deskripsi": await editorController.getText(),
      "idAsset": usage.idAsset,
      "listTipe": types.map((type) {
        final tipe = type.tipe;
        final result = {"index": types.indexOf(type), "judul": tipe.judul, "body": tipe.body};
        return result;
      }).toList(),
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
    isLoading.value = true;
    update();
  }

  @override
  void onInit() async {
    getArticles().then((res) {
      if (res.data != null) {
        articles.value = res.data!;
        searchedList.value = res.data!.payload ?? [];
      }
    });
    super.onInit();
  }

  void onSearch(String text) {
    bool isOnSearch = text != "";
    searchedList.value = (articles.value.payload ?? []).where((artikel) {
      final String judul = artikel.judul?.toLowerCase() ?? "";
      final String keyword = text.toLowerCase();
      bool searchedItem = judul.contains(keyword);
      return isOnSearch ? searchedItem : true;
    }).toList();
    update();
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
