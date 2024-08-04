import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../theme/app_colors.dart';
import '../controllers/product_detail_controller.dart';

class ProductInputFeatureCard extends GetView<ProductDetailController> {
  const ProductInputFeatureCard({super.key, required this.feature});

  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          final isLoading = controller.isLoading.value;
          final state = isLoading ? ButtonState.loading : ButtonState.enable;
          return AppIconButton(
            state: state,
            onTap: () {
              controller.features.removeWhere((feature) => feature == this.feature);
            },
            icon: Icons.remove_rounded,
            color: AppColors.red,
          );
        }),
        Gaps.horizontal.s,
        Expanded(
          child: Column(
            children: [
              AppTextField(
                label: const Text("Nama Fitur"),
                isError: false,
                focusNode: feature.focusNode,
                controller: feature.textController,
                onChanged: (text) => controller.features.firstWhere((feature) => feature == this.feature).fitur.judul = text,
              ),
              Gaps.vertical.s,
              AppHtmlEditor(
                editorController: feature.editorController,
                hint: "Deskripsi Fitur",
                initialText: feature.fitur.body,
                onChanged: (text) => controller.features.firstWhere((feature) => feature == this.feature).fitur.body = text,
              ),
            ],
          ),
        )
      ],
    );
  }
}
