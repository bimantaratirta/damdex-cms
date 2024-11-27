import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/videos/model/model_video.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/iso_parser.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 160,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(Sizes.xs)),
              color: AppColors.white,
            ),
            child: Image.network(
              APIPath.assetId(video.idAsset ?? ""),
              fit: BoxFit.contain,
            ),
          ),
          Gaps.horizontal.m,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBold(
                  text: video.judul ?? "",
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Gaps.vertical.xs,
                Text(
                  isoParser(video.updatedAt?.toIso8601String()),
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
                Gaps.vertical.s,
                AppButton(
                  type: ButtonType.elevated,
                  onPressed: () => Get.toNamed(Routes.VIDEO_DETAIL, arguments: video.id),
                  fixedSize: const Size(110, 25),
                  // padding: EdgeInsets.zero,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Sizes.s),
                  ),
                  child: const Text(
                    "Selengkapnya",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
