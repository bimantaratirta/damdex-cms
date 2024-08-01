import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/product/data/delete_product.dart';
import '../../../data/api/product/data/get_product.dart';
import '../../../data/api/product/models/model_get_product.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../shareds/widgets/app_gaps.dart';
import '../../../theme/app_colors.dart';

class ProductDetailController extends GetxController {
  final Rx<ModelGetProduct?> produk = Rx<ModelGetProduct?>(null);

  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final HtmlEditorController editorController = HtmlEditorController();

  Rx<Fitur?> selectedFeature = Rx<Fitur?>(null);
  RxBool isOnEdit = false.obs;

  void setSelectedFeature(Fitur val) {
    if (selectedFeature.value == val) {
      selectedFeature.value = null;
    } else {
      selectedFeature.value = val;
    }
  }

  @override
  Future<void> onInit() async {
    if (Get.arguments == null) {
      Get.offAllNamed(Routes.PRODUCT);
    } else {
      final response = await getProduct(Get.arguments);
      if (response.data != null) {
        produk.value = response.data;
        nameC.text = response.data?.judul ?? "";
      }
    }
    super.onInit();
  }

  Future<void> delete() async {
    final produk = this.produk.value;
    Get.dialog(AlertDialog(
      title: Text("Hapus ${produk?.judul}"),
      actions: [
        b.AppButton(
          type: b.ButtonType.outlined,
          onPressed: Get.back,
          fixedSize: const Size(100, 40),
          child: const Text("Batal"),
        ),
        Gaps.horizontal.r,
        b.AppButton(
          type: b.ButtonType.elevated,
          backgroundColor: AppColors.red,
          onPressed: () {
            deleteProduct(produk?.id ?? "").then((res) {
              Get.offAllNamed(Routes.PRODUCT);
            });
          },
          fixedSize: const Size(100, 40),
          child: const Text("Hapus"),
        ),
      ],
    ));
  }
}
