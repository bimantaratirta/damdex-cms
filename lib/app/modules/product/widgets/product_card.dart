import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/product/models/model_get_products.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.produk,
  });

  final Produk produk;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.sm),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizes.s),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(Sizes.xs),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  APIPath.assetId(produk.idAsset ?? ""),
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Gaps.vertical.r,
          TextBold(
            text: produk.judul ?? "-",
            fontWeight: FontWeight.w500,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
          ),
          Gaps.vertical.r,
          AppButton(
            type: ButtonType.elevated,
            onPressed: () => Get.toNamed(Routes.PRODUCT_DETAIL, arguments: produk.id, preventDuplicates: false),
            child: const Text("Details"),
          ),
        ],
      ),
    );
  }
}
