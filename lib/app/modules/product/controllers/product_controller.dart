import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/product/data/get_products.dart';
import '../../../data/api/product/models/model_get_produk.dart';

class ProductController extends GetxController {
  Rx<List<Produk>?> listProduk = Rx<List<Produk>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    final response = await getProducts();
    if (response.data != null) {
      listProduk.value = response.data?.payload ?? [];
    }
    super.onInit();
  }
}
