import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/article/data/get_articles.dart';
import '../../../data/api/article/model/model_articles.dart';
import '../../../data/api/usage/data/delete_usage.dart';
import '../../../data/api/usage/data/get_usage.dart';
import '../../../data/api/usage/data/patch_usage.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../theme/app_colors.dart';

class UsageDetailController extends GetxController {
  final Rx<ModelUsage?> usage = Rx<ModelUsage?>(null);
  final RxList<UsageType> types = RxList<UsageType>([]);
  final Rx<ModelArticles> articles = Rx<ModelArticles>(ModelArticles(totalAllData: 0, payload: []));
  final Rx<Artikel?> selectedArticle = Rx<Artikel?>(null);

  final ScrollController scrollController = ScrollController();
  final TextEditingController nameC = TextEditingController();
  final FocusNode nameFN = FocusNode();
  final HtmlEditorController editorController = HtmlEditorController();

  Rx<UsageType?> seletedType = Rx<UsageType?>(null);
  RxBool isOnEdit = false.obs;
  RxBool isOnDialog = false.obs;
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
    getArticles().then((res) {
      if (res.data != null) {
        articles.value = res.data!;
      }
    });
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

  Future<void> patch() async {
    final response = await patchUsage(
      usage.value?.id ?? "",
      {
        "judul": usage.value?.judul,
        "deskripsi": await editorController.getText(),
        "idAsset": usage.value?.idAsset,
        "listArtikel": usage.value?.listArtikel
            ?.map((article) => {"index": usage.value?.listArtikel?.indexOf(article), "idArtikel": article.id})
            .toList(),
        "listTipe": types.map((type) {
          final tipe = type.tipe;
          final result = {"id": tipe.id, "index": types.indexOf(type), "judul": tipe.judul, "body": tipe.body};
          if (tipe.id == null) result.remove("id");
          return result;
        }).toList(),
      },
    );
    final sc = response.statusCode ?? 0;
    if (sc >= 200 && sc < 300) {
      isOnEdit.value = false;
      final response = await getUsage(Get.arguments ?? "");
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
      }
      isError.value = false;
      update();
    } else {
      scrollController.jumpTo(0);
      isError.value = true;
    }
  }

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
