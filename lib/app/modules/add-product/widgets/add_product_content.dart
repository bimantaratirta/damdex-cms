import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/asset/data/upload_asset.dart';
import '../../../data/api/product/models/model_get_product.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/add_product_controller.dart';
import 'add_product_input_feature_card.dart';

class AddProductContent extends GetView<AddProductController> {
  const AddProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topLeft,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(Sizes.l),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () => Get.offAllNamed(Routes.PRODUCT),
                child: Padding(
                  padding: const EdgeInsets.all(Sizes.s),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_back),
                      Gaps.horizontal.r,
                      const TextBold(
                        text: "Produk",
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
                  onPressed: () => Get.offAllNamed(Routes.PRODUCT),
                  fixedSize: const Size(100, 40),
                  child: const Text("Batal"),
                ),
                Gaps.horizontal.r,
                b.AppButton(
                  type: b.ButtonType.elevated,
                  backgroundColor: AppColors.primary,
                  onPressed: () {},
                  fixedSize: const Size(100, 40),
                  child: const Text("Simpan"),
                ),
              ],
            ),
            Gaps.vertical.m,
            Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: AppTextField(
                  label: const Text("Nama Produk"),
                  isError: false,
                  focusNode: controller.nameFN,
                  controller: controller.nameC,
                  onChanged: (text) {
                    controller.product.value.judul = text;
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
                      controller.product.value.idAsset = APIPath.assetId(id);
                      controller.update();
                    }
                  }
                },
                child: GetBuilder<AddProductController>(builder: (controller) {
                  final image = controller.product.value.idAsset;
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
                              image: NetworkImage(image),
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
            AppHtmlEditor(editorController: controller.editorController, hint: "Deskripsi Produk"),
            Gaps.vertical.m,
            Wrap(
              spacing: Sizes.m,
              children: [
                const TextBold(
                  text: "Fitur",
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.r,
                ),
                AppIconButton(
                  onTap: () {
                    controller.product.value.listFitur?.add(Fitur());
                    controller.update();
                  },
                  icon: Icons.add,
                ),
              ],
            ),
            Gaps.vertical.r,
            GetBuilder<AddProductController>(builder: (controller) {
              final features = controller.product.value.listFitur ?? [];
              return Column(
                children: [...features.map((fitur) => AddProductInputFeatureCard(fitur: fitur))],
              );
            })
          ],
        ),
      ),
    );
  }
}
