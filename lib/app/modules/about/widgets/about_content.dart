import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/asset/data/upload_asset.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/about_controller.dart';
import '../../../shareds/widgets/app_button.dart' as b;

class AboutContent extends GetView<AboutController> {
  const AboutContent({super.key});

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
              Obx(() {
                final isOnEdit = controller.isOnEdit.value;
                final isLoading = controller.isLoading.value;
                final state = isLoading ? b.ButtonState.loading : b.ButtonState.enable;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: isOnEdit
                      ? [
                          b.AppButton(
                            state: state,
                            type: b.ButtonType.outlined,
                            onPressed: () {
                              controller.isOnEdit.value = false;
                              controller.update();
                            },
                            fixedSize: const Size(100, 40),
                            child: const Text("Batal"),
                          ),
                          Gaps.horizontal.r,
                          b.AppButton(
                            state: state,
                            type: b.ButtonType.elevated,
                            backgroundColor: AppColors.primary,
                            onPressed: controller.patch,
                            fixedSize: const Size(100, 40),
                            child: const Text("Simpan"),
                          ),
                        ]
                      : [
                          b.AppButton(
                            state: state,
                            type: b.ButtonType.elevated,
                            onPressed: () {
                              controller.isOnEdit.value = true;
                              controller.update();
                            },
                            fixedSize: const Size(100, 40),
                            child: const Text("Edit"),
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
              Obx(() {
                final judul = controller.article.value?.judul ?? "";
                final isOnEdit = controller.isOnEdit.value;
                return isOnEdit
                    ? Align(
                        alignment: Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: AppTextField(
                            label: const Text("Judul Kesimpulan"),
                            isError: false,
                            focusNode: controller.nameFN,
                            controller: controller.nameC,
                            onChanged: (text) {
                              controller.article.value?.judul = text;
                            },
                          ),
                        ),
                      )
                    : TextBold(
                        text: judul,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.m,
                      );
              }),
              Gaps.vertical.r,
              GetBuilder<AboutController>(builder: (controller) {
                final isOnEdit = controller.isOnEdit.value;
                final isLoading = controller.isLoading.value;
                final image = controller.article.value?.idAsset ?? "";
                return Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: isOnEdit
                        ? () async {
                            final result = await FilePicker.platform.pickFiles(type: FileType.image);
                            if (result?.files.isNotEmpty ?? false) {
                              final file = result?.files[0];
                              controller.isLoading.value = true;
                              controller.update();
                              final response = await uploadAsset(bytes: file?.bytes?.toList(), fileName: file?.name ?? "");
                              if (response.data != null) {
                                final id = response.data ?? "";
                                controller.article.value?.idAsset = id;
                              }
                            }

                            controller.isLoading.value = false;
                            controller.update();
                          }
                        : null,
                    child: Container(
                      width: 350,
                      height: 150,
                      alignment: isLoading ? Alignment.center : Alignment.topRight,
                      padding: const EdgeInsets.all(Sizes.s),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(Sizes.xs)),
                        color: AppColors.white,
                        image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          image: NetworkImage(APIPath.assetId(image)),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: isOnEdit
                          ? isLoading
                              ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator())
                              : const Icon(Icons.edit_rounded, size: 24)
                          : null,
                    ),
                  ),
                );
              }),
              Gaps.vertical.m,
              const TextBold(
                text: "Deskripsi",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.r,
              ),
              Gaps.vertical.r,
              Obx(() {
                final deskripsi = controller.article.value?.body ?? "";
                final isOnEdit = controller.isOnEdit.value;
                final isHidden = controller.isHidden.value;
                return isOnEdit
                    ? GetBuilder<AboutController>(builder: (controller) {
                        return Stack(
                          children: [
                            if (isHidden) Container(),
                            AppHtmlEditor(
                              editorController: controller.editorController,
                              hint: "Kesimpulan Damdex",
                              initialText: deskripsi,
                            )
                          ],
                        );
                      })
                    : HtmlWidget(
                        deskripsi,
                        renderMode: RenderMode.column,
                        textStyle: const TextStyle(fontSize: 14),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
