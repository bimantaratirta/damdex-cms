import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../shareds/widgets/app_button.dart';
import '../../shareds/widgets/app_gaps.dart';
import '../../shareds/widgets/app_textfield.dart';
import '../../shareds/widgets/text_bold.dart';
import '../controllers/product_controller.dart';
import 'product_card.dart';

class ProductContent extends GetView<ProductController> {
  const ProductContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final listProduk = controller.listProduk.value;
        if (listProduk == null) {
          return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
        }
        return Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(Sizes.l),
            children: [
              const TextBold(
                text: "Produk",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.l,
              ),
              Gaps.vertical.xh,
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: AppTextField(
                    label: const Text("Cari Product"),
                    isError: false,
                    focusNode: controller.searchFN,
                    controller: controller.searchC,
                  ),
                ),
              ),
              Gaps.vertical.m,
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  type: ButtonType.elevated,
                  onPressed: () {},
                  child: const Text("Tambah Produk"),
                ),
              ),
              Gaps.vertical.l,
              AlignedGridView.extent(
                shrinkWrap: true,
                maxCrossAxisExtent: 200,
                itemCount: listProduk.length,
                mainAxisSpacing: Sizes.r,
                crossAxisSpacing: Sizes.r,
                itemBuilder: (context, index) {
                  final produk = listProduk[index];
                  return ProductCard(produk: produk);
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
