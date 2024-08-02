import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

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
        AppIconButton(
          onTap: () {
            controller.types.removeWhere((type) => type == this.type);
          },
          icon: Icons.remove_rounded,
          color: AppColors.red,
        ),
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
              AppHtmlEditor(
                editorController: type.editorController,
                hint: "Deskripsi Tipe",
                initialText: type.tipe.body,
                onChanged: (text) => controller.types.firstWhere((type) => type == this.type).tipe.body = text,
              ),
            ],
          ),
        )
      ],
    );
  }
}
