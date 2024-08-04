import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../theme/app_colors.dart';
import '../controllers/add_product_controller.dart';

class AddProductInputFeatureCard extends GetView<AddProductController> {
  const AddProductInputFeatureCard({super.key, required this.feature});

  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GetBuilder<AddProductController>(builder: (controller) {
          final isLoading = controller.isLoading.value;
          final state = isLoading ? ButtonState.loading : ButtonState.enable;
          return AppIconButton(
            state: state,
            onTap: () {
              controller.features.removeWhere((fitur) => fitur == feature);
              controller.update();
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
                label: Text(feature.fitur.judul ?? ""),
                isError: false,
                focusNode: feature.focusNode,
                controller: feature.textController,
                onTapOutside: (e) {},
                onChanged: (text) {
                  controller.features.firstWhere((fitur) => fitur == feature).fitur.judul = text;
                },
              ),
              Gaps.vertical.s,
              AppHtmlEditor(
                editorController: feature.editorController,
                hint: feature.fitur.body ?? "",
                onChanged: (text) {
                  controller.features.firstWhere((fitur) => fitur == feature).fitur.body = text;
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
