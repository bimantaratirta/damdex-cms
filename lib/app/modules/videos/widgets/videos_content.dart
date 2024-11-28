import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_textfield.dart';
import '../../../shareds/widgets/empty_list.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/videos_controller.dart';
import 'video_card.dart';

class VideosContent extends GetView<VideosController> {
  const VideosContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        final listVideo = controller.searchedList.value;
        if (listVideo == null) {
          return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
        }

        listVideo.sort((a, b) => (a.index ?? 0).compareTo(b.index ?? 0));

        return Align(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(Sizes.l),
            children: [
              const TextBold(
                text: "Videos",
                fontWeight: FontWeight.bold,
                fontSize: Sizes.l,
              ),
              Gaps.vertical.xh,
              Align(
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: AppTextField(
                    label: const Text("Cari Video"),
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
                  onPressed: () => Get.toNamed(Routes.ADD_VIDEO),
                  child: const Text("Tambah Video"),
                ),
              ),
              Gaps.vertical.l,
              if (listVideo.isEmpty) ...[
                const EmptyList(description: "Video Kosong"),
              ] else ...[
                AlignedGridView.extent(
                  shrinkWrap: true,
                  maxCrossAxisExtent: 600,
                  itemCount: listVideo.length,
                  mainAxisSpacing: Sizes.r,
                  crossAxisSpacing: Sizes.r,
                  itemBuilder: (context, index) {
                    final video = listVideo[index];
                    return VideoCard(video: video);
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
