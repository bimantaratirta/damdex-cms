import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/product/models/model_get_product.dart';
import '../../../theme/app_colors.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailFeatureCard extends GetView<ProductDetailController> {
  const ProductDetailFeatureCard({
    super.key,
    required this.fitur,
  });

  final Fitur fitur;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => controller.setSelectedFeature(fitur),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.r),
            color: AppColors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(
                  text: fitur.judul ?? "-",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.white,
                ),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          final isOpen = controller.selectedFeature.value == fitur;
          return isOpen
              ? Container(
                  padding: const EdgeInsets.all(Sizes.s),
                  child: HtmlWidget(
                    fitur.body ?? "",
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
