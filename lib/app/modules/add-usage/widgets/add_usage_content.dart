import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/asset/data/upload_asset.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/add_usage_controller.dart';
import 'add_usage_article_card.dart';
import 'add_usage_input_type_card.dart';

class AddUsageContent extends GetView<AddUsageController> {
  const AddUsageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          padding: const EdgeInsets.all(Sizes.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => SchedulerBinding.instance.addPostFrameCallback((_) => Get.offAllNamed(Routes.USAGE)),
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.s),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_back),
                        Gaps.horizontal.r,
                        const TextBold(
                          text: "Cara Pakai",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gaps.vertical.l,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  b.AppButton(
                    type: b.ButtonType.outlined,
                    onPressed: () => Get.offAllNamed(Routes.USAGE),
                    fixedSize: const Size(100, 40),
                    child: const Text("Batal"),
                  ),
                  Gaps.horizontal.r,
                  b.AppButton(
                    type: b.ButtonType.elevated,
                    backgroundColor: AppColors.primary,
                    onPressed: controller.submit,
                    fixedSize: const Size(100, 40),
                    child: const Text("Simpan"),
                  ),
                ],
              ),
              Gaps.vertical.m,
              Obx(() {
                final isError = controller.isError.value;
                return isError
                    ? Column(
                        children: [
                          const TextBold(
                            text: "Semua data wajib terisi!",
                            color: AppColors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          Gaps.vertical.m,
                        ],
                      )
                    : const SizedBox();
              }),
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: AppTextField(
                    label: const Text("Nama Cara Pakai"),
                    isError: false,
                    focusNode: controller.nameFN,
                    controller: controller.nameC,
                    onChanged: (text) {
                      controller.usage.value.judul = text;
                    },
                  ),
                ),
              ),
              Gaps.vertical.m,
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () async {
                    final result = await FilePicker.platform.pickFiles(type: FileType.image);
                    if (result?.files.isNotEmpty ?? false) {
                      final file = result?.files[0];
                      final response = await uploadAsset(bytes: file?.bytes?.toList(), fileName: file?.name ?? "");
                      if (response.data != null) {
                        final id = response.data ?? "";
                        controller.usage.value.idAsset = id;
                        controller.update();
                      }
                    }
                  },
                  child: GetBuilder<AddUsageController>(builder: (controller) {
                    final image = controller.usage.value.idAsset;
                    return Container(
                      width: 350,
                      height: 150,
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.all(Sizes.s),
                      decoration: BoxDecoration(
                        color: AppColors.lightenGrey,
                        borderRadius: const BorderRadius.all(Radius.circular(Sizes.xs)),
                        image: image == null
                            ? null
                            : DecorationImage(
                                image: NetworkImage(APIPath.assetId(image)),
                                fit: BoxFit.cover,
                              ),
                      ),
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 24,
                      ),
                    );
                  }),
                ),
              ),
              Gaps.vertical.m,
              const TextBold(
                text: "Deskripsi",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.r,
              ),
              Gaps.vertical.r,
              AppHtmlEditor(
                editorController: controller.editorController,
                hint: "Deskripsi Cara Pakai",
              ),
              Gaps.vertical.m,
              Wrap(
                spacing: Sizes.m,
                children: [
                  const TextBold(
                    text: "Tipe",
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.r,
                  ),
                  AppIconButton(
                    onTap: () {
                      controller.types.add(
                        UsageType(
                          tipe: Tipe(),
                          focusNode: FocusNode(),
                          textController: TextEditingController(),
                          editorController: HtmlEditorController(),
                        ),
                      );
                      controller.update();
                      Future.delayed(const Duration(milliseconds: 1)).then((e) {
                        controller.scrollController.jumpTo(controller.scrollController.position.maxScrollExtent);
                      });
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              Gaps.vertical.r,
              GetBuilder<AddUsageController>(builder: (controller) {
                final types = controller.types;
                return Column(
                  children: [...types.map((type) => AddUsageInputTypeCard(type: type))],
                );
              }),
              Gaps.vertical.m,
              Wrap(
                spacing: Sizes.m,
                children: [
                  const TextBold(
                    text: "Artikel Terkait",
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.r,
                  ),
                  AppIconButton(
                    onTap: () {
                      Get.dialog(AlertDialog(
                        title: const Text("Artikel Lainnya"),
                        actions: [
                          b.AppButton(
                            type: b.ButtonType.outlined,
                            onPressed: Get.back,
                            fixedSize: const Size(100, 40),
                            child: const Text("Batal"),
                          ),
                        ],
                      ));
                      controller.update();
                      Future.delayed(const Duration(milliseconds: 1)).then((e) {
                        controller.scrollController.jumpTo(controller.scrollController.position.maxScrollExtent);
                      });
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              Gaps.vertical.r,
              GetBuilder<AddUsageController>(builder: (controller) {
                final listArtikel = controller.usage.value.listArtikel ?? [];
                return AlignedGridView.extent(
                  shrinkWrap: true,
                  maxCrossAxisExtent: 200,
                  itemCount: listArtikel.length,
                  mainAxisSpacing: Sizes.r,
                  crossAxisSpacing: Sizes.r,
                  itemBuilder: (context, index) {
                    final artikel = listArtikel[index];
                    return AddUsageArticleCard(artikel: artikel);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
