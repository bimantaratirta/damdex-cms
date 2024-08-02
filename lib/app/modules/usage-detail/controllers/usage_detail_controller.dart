import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/usage/data/delete_usage.dart';
import '../../../data/api/usage/data/get_usage.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../theme/app_colors.dart';

class UsageDetailController extends GetxController {
  final Rx<ModelUsage?> usage = Rx<ModelUsage?>(null);
  final RxList<UsageType> types = RxList<UsageType>([]);

  final ScrollController scrollController = ScrollController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final HtmlEditorController editorController = HtmlEditorController();

  Rx<UsageType?> seletedType = Rx<UsageType?>(null);
  RxBool isOnEdit = false.obs;
  RxBool isError = false.obs;

  void setSelectedType(UsageType val) {
    if (seletedType.value == val) {
      seletedType.value = null;
    } else {
      seletedType.value = val;
    }
  }

  @override
  Future<void> onInit() async {
    final response = await getUsage(Get.arguments ?? "null");
    if (response.data != null) {
      usage.value = response.data;
      nameC.text = response.data?.judul ?? "";
      types.value = (response.data?.listTipe ?? []).map((tipe) {
        return UsageType(
          focusNode: FocusNode(),
          textController: TextEditingController(text: tipe.judul),
          editorController: HtmlEditorController(),
          tipe: tipe,
        );
      }).toList();
    } else {
      Get.offNamed(Routes.USAGE);
    }
    update();
    super.onInit();
  }

  void patch() {}
  Future<void> delete() async {
    final usage = this.usage.value;
    Get.dialog(AlertDialog(
      title: Text("Hapus Cara Penggunaan ${usage?.judul}?"),
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
            deleteUsage(usage?.id ?? "").then((res) {
              Get.offAllNamed(Routes.USAGE);
            });
          },
          fixedSize: const Size(100, 40),
          child: const Text("Hapus"),
        ),
      ],
    ));
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
