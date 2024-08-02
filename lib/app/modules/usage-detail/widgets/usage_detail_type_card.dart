import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../controllers/usage_detail_controller.dart';

class UsageDetailTypeCard extends GetView<UsageDetailController> {
  const UsageDetailTypeCard({super.key, required this.type});

  final UsageType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => controller.setSelectedType(type),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.r),
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextBold(
                    text: type.tipe.judul ?? "-",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
                Gaps.horizontal.m,
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          final isOpen = controller.seletedType.value == type;
          return isOpen
              ? Container(
                  padding: const EdgeInsets.all(Sizes.s),
                  child: HtmlWidget(
                    type.tipe.body ?? "",
                    renderMode: RenderMode.column,
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                )
              : const SizedBox();
        })
      ],
    );
  }
}
