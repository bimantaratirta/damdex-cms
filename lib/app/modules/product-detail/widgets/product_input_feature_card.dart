import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../data/api/product/models/model_get_product.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../theme/app_colors.dart';
import '../controllers/product_detail_controller.dart';

class ProductInputFeatureCard extends GetView<ProductDetailController> {
  const ProductInputFeatureCard({super.key, required this.fitur});

  final Fitur fitur;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIconButton(
          onTap: () {
            controller.produk.value?.listFitur?.removeWhere((fitur) => fitur == this.fitur);
          },
          icon: Icons.remove_rounded,
          color: AppColors.red,
        ),
        Gaps.horizontal.s,
        Expanded(
          child: Column(
            children: [
              AppTextField(
                label: Text(fitur.judul ?? ""),
                isError: false,
                focusNode: FocusNode(),
                controller: TextEditingController(),
              ),
              Gaps.vertical.s,
              AppHtmlEditor(
                editorController: HtmlEditorController(),
                hint: fitur.body ?? "",
              ),
            ],
          ),
        )
      ],
    );
  }
}
