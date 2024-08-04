import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/usage/data/get_usages.dart';
import '../../../data/api/usage/model/model_get_usages.dart';

class UsageController extends GetxController {
  List<Usage>? listUsage;
  Rx<List<Usage>?> searchedList = Rx<List<Usage>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await adminValidate().then((res) async {
      if (res.statusCode == 200) {
        final response = await getUsages();
        if (response.data != null) {
          listUsage = response.data?.payload ?? [];
          searchedList.value = response.data?.payload ?? [];
        }
      }
    });

    super.onInit();
  }

  void onSearch(String text) {
    bool isOnSearch = text != "";
    searchedList.value = listUsage?.where((produk) {
      final String judul = produk.judul?.toLowerCase() ?? "";
      final String keyword = text.toLowerCase();
      bool searchedItem = judul.contains(keyword);
      return isOnSearch ? searchedItem : true;
    }).toList();
  }
}
