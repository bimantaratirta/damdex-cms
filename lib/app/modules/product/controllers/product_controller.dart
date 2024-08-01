import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/product/data/get_products.dart';
import '../../../data/api/product/models/model_get_products.dart';

class ProductController extends GetxController {
  List<Produk>? listProduk;
  Rx<List<Produk>?> searchedList = Rx<List<Produk>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    await adminValidate().then((res) async {
      if (res.statusCode == 200) {
        final response = await getProducts();
        if (response.data != null) {
          listProduk = response.data?.payload ?? [];
          searchedList.value = response.data?.payload ?? [];
        }
      }
    });

    super.onInit();
  }

  void onSearch(String text) {
    bool isOnSearch = text != "";
    searchedList.value = listProduk?.where((produk) {
      final String judul = produk.judul?.toLowerCase() ?? "";
      final String keyword = text.toLowerCase();
      bool searchedItem = judul.contains(keyword);
      return isOnSearch ? searchedItem : true;
    }).toList();
  }
}
