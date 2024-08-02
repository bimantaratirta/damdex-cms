import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/article/data/get_articles.dart';
import '../../../data/api/article/model/model_articles.dart';

class ArticleController extends GetxController {
  List<Artikel>? listArtikel;
  Rx<List<Artikel>?> searchedList = Rx<List<Artikel>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await adminValidate().then((res) async {
      if (res.statusCode == 200) {
        final response = await getArticles();
        if (response.data != null) {
          listArtikel = response.data?.payload ?? [];
          searchedList.value = response.data?.payload ?? [];
        }
      }
    });

    super.onInit();
  }

  void onSearch(String text) {
    bool isOnSearch = text != "";
    searchedList.value = listArtikel?.where((artikel) {
      final String judul = artikel.judul?.toLowerCase() ?? "";
      final String keyword = text.toLowerCase();
      bool searchedItem = judul.contains(keyword);
      return isOnSearch ? searchedItem : true;
    }).toList();
  }
}
