import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/admin/data/admin_validate.dart';
import '../../../data/api/toko/data/get_toko_provinsi.dart';
import '../../../data/api/toko/data/post_toko.dart';
import '../../../data/api/toko/model/model_toko_provinsi.dart';

class TokoController extends GetxController {
  Rx<NewToko> newToko = Rx<NewToko>(NewToko());
  Rx<ModelTokoProvinsi?> tokoProvinsi = Rx<ModelTokoProvinsi?>(null);
  Rx<List<TokoProvinsi>?> searchedList = Rx<List<TokoProvinsi>?>(null);

  final TextEditingController searchC = TextEditingController();
  final FocusNode searchFN = FocusNode();

  RxBool isError = false.obs;

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

  void submit() async {
    isError.value = false;
    final response = await postToko(newToko.value.toJson());
    if (response.data != null) {
      await onInit();
      newToko.value = NewToko();
      Get.back();
    } else {
      isError.value = true;
    }
  }
}

class NewToko {
  String? nama;
  String? detail;
  String? noHp;
  String? tipe;
  int? idKota;
  String? kota;

  NewToko({
    this.nama,
    this.detail,
    this.noHp,
    this.tipe,
    this.idKota,
    this.kota,
  });

  NewToko copyWith({
    String? nama,
    String? detail,
    String? noHp,
    String? tipe,
    int? idKota,
    String? kota,
  }) =>
      NewToko(
        nama: nama ?? this.nama,
        detail: detail ?? this.detail,
        noHp: noHp ?? this.noHp,
        tipe: tipe ?? this.tipe,
        idKota: idKota ?? this.idKota,
        kota: kota ?? this.kota,
      );

  factory NewToko.fromRawJson(String str) => NewToko.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewToko.fromJson(Map<String, dynamic> json) => NewToko(
        nama: json["nama"],
        detail: json["detail"],
        noHp: json["noHp"],
        tipe: json["tipe"],
        idKota: json["idKota"],
        kota: json["kota"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "detail": detail,
        "noHp": noHp,
        "tipe": tipe,
        "idKota": idKota,
        "kota": kota,
      };
}
