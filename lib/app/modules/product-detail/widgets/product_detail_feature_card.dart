import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../theme/app_colors.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailFeatureCard extends GetView<ProductDetailController> {
  const ProductDetailFeatureCard({
    super.key,
    required this.feature,
  });

  final Feature feature;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => controller.setSelectedFeature(feature),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.r),
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextBold(
                    text: feature.fitur.judul ?? "-",
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
          final isOpen = controller.selectedFeature.value == feature;
          return isOpen
              ? Container(
                  padding: const EdgeInsets.all(Sizes.s),
                  child: HtmlWidget(
                    feature.fitur.body ?? "",
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
