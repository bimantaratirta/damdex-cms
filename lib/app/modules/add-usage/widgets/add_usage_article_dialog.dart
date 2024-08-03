import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/article/model/model_articles.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/empty_list.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../../../shareds/widgets/app_button.dart' as b;
import '../../../utils/iso_parser.dart';
import '../controllers/add_usage_controller.dart';

class AddUsageArticleDialog extends StatelessWidget {
  const AddUsageArticleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Pilih Artikel"),
      scrollable: true,
      content: GetBuilder<AddUsageController>(builder: (controller) {
        final articles = controller.searchedList;
        final selectedArticle = controller.selectedArticle.value;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AppTextField(
              label: const Text("Cari Artikel"),
              isError: false,
              focusNode: FocusNode(),
              onChanged: controller.onSearch,
            ),
            if (articles.isEmpty) const EmptyList(description: "Artikel Tidak Ditemukan"),
            for (Artikel article in articles)
              InkWell(
                onTap: () {
                  controller.selectedArticle.value = article;
                  controller.update();
                },
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(Sizes.r),
                  decoration: selectedArticle == article
                      ? BoxDecoration(
                          border: Border.all(color: AppColors.primary, width: 2),
                          borderRadius: const BorderRadius.all(Radius.circular(Sizes.xs)),
                        )
                      : null,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 160,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(Sizes.xs)),
                          color: AppColors.lightenGrey,
                        ),
                        child: Image.network(
                          APIPath.assetId(article.idAsset ?? ""),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gaps.horizontal.m,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextBold(
                              text: article.judul ?? "",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gaps.vertical.xs,
                            Text(
                              isoParser(article.updatedAt?.toIso8601String()),
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ],
        );
      }),
      actions: [
        b.AppButton(
          type: b.ButtonType.outlined,
          onPressed: Get.back,
          fixedSize: const Size(100, 40),
          child: const Text("Batal"),
        ),
        GetBuilder<AddUsageController>(builder: (controller) {
          return b.AppButton(
            state: controller.selectedArticle.value != null ? b.ButtonState.enable : b.ButtonState.disable,
            type: b.ButtonType.elevated,
            backgroundColor: AppColors.primary,
            onPressed: () {
              if (controller.selectedArticle.value != null) {
                controller.usage.value.listArtikel?.add(
                  UsageArtikel.fromJson(controller.selectedArticle.value!.toJson()),
                );
                controller.selectedArticle.value = null;
                controller.searchedList.value = controller.articles.value.payload ?? [];
                controller.update();
              }
              Get.back();
            },
            fixedSize: const Size(100, 40),
            child: const Text("Pilih"),
          );
        }),
      ],
    );
  }
}
