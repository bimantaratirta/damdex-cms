import 'package:get/get.dart';

import '../modules/add-article/bindings/add_article_binding.dart';
import '../modules/add-article/views/add_article_view.dart';
import '../modules/add-product/bindings/add_product_binding.dart';
import '../modules/add-product/views/add_product_view.dart';
import '../modules/add-usage/bindings/add_usage_binding.dart';
import '../modules/add-usage/views/add_usage_view.dart';
import '../modules/article-detail/bindings/article_detail_binding.dart';
import '../modules/article-detail/views/article_detail_view.dart';
import '../modules/article/bindings/article_binding.dart';
import '../modules/article/views/article_view.dart';
import '../modules/log-detail/bindings/log_detail_binding.dart';
import '../modules/log-detail/views/log_detail_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logs/bindings/logs_binding.dart';
import '../modules/logs/views/logs_view.dart';
import '../modules/newversion.apk/bindings/newversion_apk_binding.dart';
import '../modules/newversion.apk/views/newversion_apk_view.dart';
import '../modules/product-detail/bindings/product_detail_binding.dart';
import '../modules/product-detail/views/product_detail_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/toko-kota/bindings/toko_kota_binding.dart';
import '../modules/toko-kota/views/toko_kota_view.dart';
import '../modules/toko/bindings/toko_binding.dart';
import '../modules/toko/views/toko_view.dart';
import '../modules/usage-detail/bindings/usage_detail_binding.dart';
import '../modules/usage-detail/views/usage_detail_view.dart';
import '../modules/usage/bindings/usage_binding.dart';
import '../modules/usage/views/usage_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCT;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.USAGE,
      page: () => const UsageView(),
      binding: UsageBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE,
      page: () => const ArticleView(),
      binding: ArticleBinding(),
    ),
    GetPage(
      name: _Paths.TOKO,
      page: () => const TokoView(),
      binding: TokoBinding(),
    ),
    GetPage(
      name: _Paths.LOGS,
      page: () => const LogsView(),
      binding: LogsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.USAGE_DETAIL,
      page: () => const UsageDetailView(),
      binding: UsageDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_USAGE,
      page: () => const AddUsageView(),
      binding: AddUsageBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAIL,
      page: () => const ArticleDetailView(),
      binding: ArticleDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ARTICLE,
      page: () => const AddArticleView(),
      binding: AddArticleBinding(),
    ),
    GetPage(
      name: _Paths.TOKO_KOTA,
      page: () => const TokoKotaView(),
      binding: TokoKotaBinding(),
    ),
    GetPage(
      name: _Paths.LOG_DETAIL,
      page: () => const LogDetailView(),
      binding: LogDetailBinding(),
    ),
    GetPage(
      name: _Paths.NEWVERSION_APK,
      page: () => const NewversionApkView(),
      binding: NewversionApkBinding(),
    ),
  ];
}
