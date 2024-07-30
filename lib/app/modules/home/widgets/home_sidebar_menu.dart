import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/sizes.dart';
import '../../../theme/app_colors.dart';
import '../../shareds/widgets/app_gaps.dart';
import '../../shareds/widgets/text_bold.dart';

class HomeSidebarMenu extends StatelessWidget {
  const HomeSidebarMenu({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
    required this.routes,
  });

  final Widget icon;
  final String title;
  final String route;
  final List<String> routes;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Get.currentRoute != route) Get.toNamed(route);
      },
      child: Container(
        padding: const EdgeInsets.all(Sizes.m),
        color: Get.currentRoute == route || routes.contains(Get.currentRoute) ? AppColors.lightBlue : null,
        child: Row(
          children: [
            icon,
            Gaps.horizontal.r,
            TextBold(
              text: title,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
