import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/asset/data/upload_asset.dart';
import '../../../data/api/product/models/model_get_product.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../theme/app_colors.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/product_detail_controller.dart';
import 'product_detail_feature_card.dart';
import 'product_input_feature_card.dart';

class ProductDetailContent extends GetView<ProductDetailController> {
  const ProductDetailContent({super.key});

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
            Obx(() {
              final isOnEdit = controller.isOnEdit.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: isOnEdit
                    ? [
                        b.AppButton(
                          type: b.ButtonType.outlined,
                          onPressed: () => controller.isOnEdit.value = false,
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
                      ]
                    : [
                        b.AppButton(
                          type: b.ButtonType.elevated,
                          onPressed: () => controller.isOnEdit.value = true,
                          fixedSize: const Size(100, 40),
                          child: const Text("Edit"),
                        ),
                        Gaps.horizontal.r,
                        b.AppButton(
                          type: b.ButtonType.elevated,
                          backgroundColor: AppColors.red,
                          onPressed: controller.delete,
                          fixedSize: const Size(100, 40),
                          child: const Text("Hapus"),
                        ),
                      ],
              );
            }),
            Gaps.vertical.m,
            Obx(() {
              final judul = controller.produk.value?.judul ?? "";
              final isOnEdit = controller.isOnEdit.value;
              return isOnEdit
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: AppTextField(
                          label: const Text("Nama Produk"),
                          isError: false,
                          focusNode: controller.nameFN,
                          controller: controller.nameC,
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
            Obx(() {
              final isOnEdit = controller.isOnEdit.value;
              final image = controller.produk.value?.idAsset ?? "";
              return Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: isOnEdit
                      ? () async {
                          final result = await FilePicker.platform.pickFiles(type: FileType.image);
                          if (result?.files.isNotEmpty ?? false) {
                            final file = result?.files[0];
                            final response = await uploadAsset(bytes: file?.bytes?.toList(), fileName: file?.name ?? "");
                            if (response.data != null) {
                              final id = response.data ?? "";
                              controller.produk.value?.idAsset = APIPath.assetId(id);
                            }
                          }
                        }
                      : null,
                  child: Container(
                    width: 350,
                    height: 150,
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.all(Sizes.s),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(Sizes.xs)),
                      color: AppColors.lightenGrey,
                      image: DecorationImage(
                        image: NetworkImage(APIPath.assetId(image)),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: isOnEdit
                        ? const Icon(
                            Icons.edit_rounded,
                            size: 24,
                          )
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
              final deskripsi = controller.produk.value?.deskripsi ?? "";
              final isOnEdit = controller.isOnEdit.value;
              return isOnEdit
                  ? AppHtmlEditor(
                      initialText: deskripsi,
                      hint: "Deskripsi Produk",
                      editorController: controller.editorController,
                    )
                  : HtmlWidget(
                      deskripsi,
                      renderMode: RenderMode.column,
                      textStyle: const TextStyle(fontSize: 14),
                    );
            }),
            Gaps.vertical.m,
            Obx(() {
              final isOnEdit = controller.isOnEdit.value;
              return Wrap(
                spacing: Sizes.m,
                children: [
                  const TextBold(
                    text: "Fitur",
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.r,
                  ),
                  if (isOnEdit)
                    AppIconButton(
                      onTap: () {
                        controller.produk.value?.listFitur?.add(Fitur(
                          index: controller.produk.value?.listFitur?.length,
                        ));
                      },
                      icon: Icons.add,
                    ),
                ],
              );
            }),
            Gaps.vertical.r,
            Obx(() {
              final isOnEdit = controller.isOnEdit.value;
              final features = controller.produk.value?.listFitur ?? [];
              return Column(
                children: [
                  for (Fitur fitur in features) ...[
                    if (isOnEdit) ...[
                      ProductInputFeatureCard(fitur: fitur),
                      Gaps.vertical.s,
                    ] else ...[
                      ProductDetailFeatureCard(fitur: fitur)
                    ],
                  ]
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
