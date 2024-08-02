import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/toko/data/get_toko_provinsi.dart';
import '../../../data/api/toko/model/model_toko_provinsi.dart';

class TokoController extends GetxController {
  Rx<ModelTokoProvinsi?> tokoProvinsi = Rx<ModelTokoProvinsi?>(null);
  Rx<List<TokoProvinsi>?> searchedList = Rx<List<TokoProvinsi>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  @override
  Future<void> onInit() async {
    await adminValidate().then((res) async {
      if (res.statusCode == 200) {
        final response = await getTokoProvinsi();
        if (response.data != null) {
          tokoProvinsi.value = response.data;
          searchedList.value = response.data?.payload ?? [];
        }
      }
    });

    super.onInit();
  }

  void onSearch(String text) {
    bool isOnSearch = text != "";
    searchedList.value = tokoProvinsi.value?.payload?.where((toko) {
      final String provinsi = toko.provinsi?.toLowerCase() ?? "";
      final String kota = toko.kota?.toLowerCase() ?? "";
      final String keyword = text.toLowerCase();
      bool searchedItem = provinsi.contains(keyword) || kota.contains(keyword);
      return isOnSearch ? searchedItem : true;
    }).toList();
  }
}
