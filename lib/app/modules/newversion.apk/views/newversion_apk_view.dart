// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/newversion_apk_controller.dart';

class NewversionApkView extends GetView<NewversionApkController> {
  const NewversionApkView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo/app-logo.png"),
                ),
              ),
            ),
            Gaps.horizontal.m,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const TextBold(
                  text: "Damdex Aplikasi",
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.m,
                ),
                Gaps.vertical.s,
                AppButton(
                  type: ButtonType.elevated,
                  onPressed: () {
                    html.AnchorElement anchorElement =
                        html.AnchorElement(href: "/assets/assets/apk/damdex-release-1Des24.apk");
                    anchorElement.download = "damdex-release-1Des24.apk";
                    anchorElement.click();
                  },
                  child: const Text("Download"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
