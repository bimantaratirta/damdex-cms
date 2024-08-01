import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../theme/app_colors.dart';
import '../controllers/product_edit_controller.dart';

class ProductEditFeatureCard extends GetView<ProductEditController> {
  const ProductEditFeatureCard({super.key, required this.feature});

  final int feature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIconButton(
          onTap: () {
            controller.features.removeWhere((feature) => feature == this.feature);
          },
          icon: Icons.remove_rounded,
          color: AppColors.red,
        ),
        Gaps.horizontal.s,
        Expanded(
          child: Column(
            children: [
              AppTextField(
                label: const Text("Nama Fitur"),
                isError: false,
                focusNode: FocusNode(),
                controller: TextEditingController(),
              ),
              Gaps.vertical.s,
              AppHtmlEditor(
                editorController: HtmlEditorController(),
                hint: "Deskripsi Fitur",
              ),
            ],
          ),
        )
      ],
    );
  }
}
