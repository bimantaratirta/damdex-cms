import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/empty_list.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/article_controller.dart';
import 'article_card.dart';

class ArticleContent extends GetView<ArticleController> {
  const ArticleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final listArtikel = controller.searchedList.value;
        if (listArtikel == null) {
          return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
        }

        return Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(Sizes.l),
            children: [
              const TextBold(
                text: "Artikel",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.l,
              ),
              Gaps.vertical.xh,
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: AppTextField(
                    label: const Text("Cari Artikel"),
                    isError: false,
                    focusNode: controller.searchFN,
                    controller: controller.searchC,
                    onChanged: controller.onSearch,
                  ),
                ),
              ),
              Gaps.vertical.m,
              Align(
                alignment: Alignment.centerRight,
                child: AppButton(
                  type: ButtonType.elevated,
                  onPressed: () => Get.toNamed(Routes.ADD_ARTICLE),
                  child: const Text("Tambah Artikel"),
                ),
              ),
              Gaps.vertical.l,
              if (listArtikel.isEmpty) ...[
                const EmptyList(description: "Artikel Kosong"),
              ] else ...[
                AlignedGridView.extent(
                  shrinkWrap: true,
                  maxCrossAxisExtent: 600,
                  itemCount: listArtikel.length,
                  mainAxisSpacing: Sizes.r,
                  crossAxisSpacing: Sizes.r,
                  itemBuilder: (context, index) {
                    final artikel = listArtikel[index];
                    return ArticleCard(artikel: artikel);
                  },
                ),
              ]
            ],
          ),
        );
      }),
    );
  }
}
