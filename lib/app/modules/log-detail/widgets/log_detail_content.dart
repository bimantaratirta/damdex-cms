import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/sizes.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/log_detail_controller.dart';

class LogDetailContent extends GetView<LogDetailController> {
  const LogDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          controller: controller.scrollController,
          padding: const EdgeInsets.all(Sizes.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Get.offAllNamed(Routes.LOGS),
                  child: Padding(
                    padding: const EdgeInsets.all(Sizes.s),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_back),
                        Gaps.horizontal.r,
                        const TextBold(
                          text: "User Log",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gaps.vertical.l,
              Obx(() {
                final log = controller.log.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextBold(
                      text: "Device",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    Gaps.vertical.xs,
                    TextBold(
                      text: log?.device ?? "-",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    Gaps.vertical.m,
                    const TextBold(
                      text: "Lokasi",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    Gaps.vertical.xs,
                    Text.rich(
                      TextSpan(
                        children: [
                          for (dynamic key in log?.lokasi?.keys ?? []) ...[
                            TextSpan(
                              text: "$key: ",
                              children: [
                                TextSpan(
                                  text: "${log?.lokasi?["$key"]}\n",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                    const TextBold(
                      text: "Konten Menu",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    Gaps.vertical.xs,
                    TextBold(
                      text: log?.konten ?? "-",
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
