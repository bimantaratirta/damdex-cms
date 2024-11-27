import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

import '../../../data/api/product/data/delete_product.dart';
import '../../../data/api/product/data/get_product.dart';
import '../../../data/api/product/data/patch_product.dart';
import '../../../data/api/product/models/model_get_product.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../theme/app_colors.dart';

class ProductDetailController extends GetxController {
  final Rx<ModelGetProduct?> produk = Rx<ModelGetProduct?>(null);
  final RxList<Feature> features = RxList<Feature>([]);

  final ScrollController scrollController = ScrollController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final HtmlEditorController editorController = HtmlEditorController();

  Rx<Feature?> selectedFeature = Rx<Feature?>(null);
  RxBool isOnEdit = false.obs;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  void setSelectedFeature(Feature val) {
    if (selectedFeature.value == val) {
      selectedFeature.value = null;
    } else {
      selectedFeature.value = val;
    }
  }

  Future<void> patch() async {
    isLoading.value = true;
    final response = await patchProduct(produk.value?.id ?? "", {
      "judul": produk.value?.judul,
      "deskripsi": await editorController.getText(),
      "idAsset": produk.value?.idAsset,
      "listFitur": features.map((feature) {
        final result = feature.fitur.toJson();
        if (result["id"] == null) {
          result.remove("id");
        }
        return result;
      }).toList()
    });
    final sc = response.statusCode ?? 0;
    if (sc >= 200 && sc < 300) {
      isOnEdit.value = false;
      final response = await getProduct(Get.arguments ?? "");
      if (response.data != null) {
        produk.value = response.data;
        nameC.text = response.data?.judul ?? "";
        features.value = (response.data?.listFitur ?? []).map((fitur) {
          return Feature(
            focusNode: FocusNode(),
            textController: TextEditingController(text: fitur.judul),
            editorController: HtmlEditorController(),
            fitur: fitur,
          );
        }).toList();
      }
      isError.value = false;
      update();
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
    isLoading.value = false;
  }

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    final response = await getProduct(Get.arguments ?? "null");
    if (response.data != null) {
      produk.value = response.data;
      nameC.text = response.data?.judul ?? "";
      features.value = (response.data?.listFitur ?? []).map((fitur) {
        return Feature(
          focusNode: FocusNode(),
          textController: TextEditingController(text: fitur.judul),
          editorController: HtmlEditorController(),
          fitur: fitur,
        );
      }).toList();
    } else {
      Get.offNamed(Routes.PRODUCT);
    }
    isLoading.value = false;
    update();
    super.onInit();
  }

  Future<void> delete() async {
    final produk = this.produk.value;
    Get.dialog(PointerInterceptor(
      child: AlertDialog(
        title: Text("Hapus Produk ${produk?.judul}?"),
        actions: [
          b.AppButton(
            type: b.ButtonType.outlined,
            onPressed: Get.back,
            fixedSize: const Size(100, 40),
            child: const Text("Batal"),
          ),
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
      ),
    ));
  }
}

class Feature {
  final FocusNode focusNode;
  final TextEditingController textController;
  final HtmlEditorController editorController;
  final Fitur fitur;

  Feature({
    required this.focusNode,
    required this.textController,
    required this.editorController,
    required this.fitur,
  });
}
