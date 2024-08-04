import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/asset/data/upload_asset.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/add_article_controller.dart';

class AddArticleContent extends GetView<AddArticleController> {
  const AddArticleContent({super.key});

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
                  onTap: () => SchedulerBinding.instance.addPostFrameCallback((_) => Get.offAllNamed(Routes.ARTICLE)),
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.s),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_back),
                        Gaps.horizontal.r,
                        const TextBold(
                          text: "Artikel",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gaps.vertical.l,
              Obx(() {
                final isLoading = controller.isLoading.value;
                final state = isLoading ? b.ButtonState.loading : b.ButtonState.enable;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    b.AppButton(
                      state: state,
                      type: b.ButtonType.outlined,
                      onPressed: () => Get.offAllNamed(Routes.ARTICLE),
                      fixedSize: const Size(100, 40),
                      child: const Text("Batal"),
                    ),
                    Gaps.horizontal.r,
                    b.AppButton(
                      state: state,
                      type: b.ButtonType.elevated,
                      backgroundColor: AppColors.primary,
                      onPressed: controller.submit,
                      fixedSize: const Size(100, 40),
                      child: const Text("Simpan"),
                    ),
                  ],
                );
              }),
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
                    label: const Text("Judul Artikel"),
                    isError: false,
                    focusNode: controller.nameFN,
                    controller: controller.nameC,
                    onChanged: (text) {
                      controller.article.value.judul = text;
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
                      controller.isLoading.value = true;
                      controller.update();
                      final response = await uploadAsset(bytes: file?.bytes?.toList(), fileName: file?.name ?? "");
                      if (response.data != null) {
                        final id = response.data ?? "";
                        controller.article.value.idAsset = id;
                      }
                    }
                    controller.isLoading.value = false;
                    controller.update();
                  },
                  child: GetBuilder<AddArticleController>(builder: (controller) {
                    final image = controller.article.value.idAsset;
                    final isLoading = controller.isLoading.value;
                    return Container(
                      width: 350,
                      height: 150,
                      alignment: isLoading ? Alignment.center : Alignment.topRight,
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
                      child: isLoading
                          ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator())
                          : const Icon(Icons.edit_rounded, size: 24),
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
                hint: "Deskripsi Artikel",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
