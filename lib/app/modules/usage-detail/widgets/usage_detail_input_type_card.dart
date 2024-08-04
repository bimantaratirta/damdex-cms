import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_html_editor.dart';
import '../../../shareds/widgets/app_icon_button.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../theme/app_colors.dart';
import '../controllers/usage_detail_controller.dart';

class UsageDetailInputTypeCard extends GetView<UsageDetailController> {
  const UsageDetailInputTypeCard({super.key, required this.type});

  final UsageType type;

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
              controller.types.removeWhere((type) => type == this.type);
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
                label: const Text("Nama Tipe"),
                isError: false,
                focusNode: type.focusNode,
                controller: type.textController,
                onChanged: (text) => controller.types.firstWhere((type) => type == this.type).tipe.judul = text,
              ),
              Gaps.vertical.s,
              Obx(() {
                final isOnDialog = controller.isOnDialog.value;
                if (isOnDialog) {
                  return HtmlWidget(
                    controller.types.firstWhere((type) => type == this.type).tipe.body ?? "",
                    renderMode: RenderMode.column,
                    textStyle: const TextStyle(fontSize: 14),
                  );
                } else {
                  return AppHtmlEditor(
                    editorController: type.editorController,
                    hint: "Deskripsi Tipe",
                    initialText: type.tipe.body,
                    onChanged: (text) => controller.types.firstWhere((type) => type == this.type).tipe.body = text,
                  );
                }
              }),
            ],
          ),
        )
      ],
    );
  }
}
