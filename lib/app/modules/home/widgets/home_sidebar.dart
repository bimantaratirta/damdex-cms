import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import 'home_sidebar_menu.dart';

class HomeSideBar extends StatelessWidget {
  const HomeSideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      constraints: const BoxConstraints(maxWidth: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.l),
            child: Image.asset(
              "assets/logo/damdex-logo.png",
              width: 150,
            ),
          ),
          const HomeSidebarMenu(
            icon: Icon(
              Icons.home,
              color: AppColors.white,
              size: Sizes.m,
            ),
            title: "Produk",
            route: Routes.PRODUCT,
            routes: [Routes.PRODUCT, Routes.PRODUCT_DETAIL, Routes.ADD_PRODUCT],
          ),
          HomeSidebarMenu(
            icon: Image.asset("assets/icon/usage.png"),
            title: "Cara Pakai",
            route: Routes.USAGE,
            routes: const [Routes.USAGE, Routes.USAGE_DETAIL, Routes.ADD_USAGE],
          ),
          const HomeSidebarMenu(
            icon: Icon(
              Icons.article,
              color: AppColors.white,
              size: Sizes.m,
            ),
            title: "Artikel",
            route: Routes.ARTICLE,
            routes: [Routes.ARTICLE, Routes.ARTICLE_DETAIL, Routes.ADD_ARTICLE],
          ),
          const HomeSidebarMenu(
            icon: Icon(
              Icons.location_on,
              color: AppColors.white,
              size: Sizes.m,
            ),
            title: "Direktori Toko",
            route: Routes.TOKO,
            routes: [Routes.TOKO, Routes.TOKO_KOTA],
          ),
          const HomeSidebarMenu(
            icon: Icon(
              Icons.bar_chart_rounded,
              color: AppColors.white,
              size: Sizes.m,
            ),
            title: "User Log",
            route: Routes.LOGS,
            routes: [Routes.LOGS, Routes.LOG_DETAIL],
          ),
          const HomeSidebarMenu(
            icon: Icon(
              Icons.settings,
              color: AppColors.white,
              size: Sizes.m,
            ),
            title: "Pengaturan",
            route: Routes.SETTINGS,
            routes: [Routes.SETTINGS],
          ),
        ],
      ),
    );
  }
}
