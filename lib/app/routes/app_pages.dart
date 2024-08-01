import 'package:get/get.dart';

import '../modules/add-product/bindings/add_product_binding.dart';
import '../modules/add-product/views/add_product_view.dart';
import '../modules/artcle-detail/bindings/artcle_detail_binding.dart';
import '../modules/artcle-detail/views/artcle_detail_view.dart';
import '../modules/article/bindings/article_binding.dart';
import '../modules/article/views/article_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/logs/bindings/logs_binding.dart';
import '../modules/logs/views/logs_view.dart';
import '../modules/product-detail/bindings/product_detail_binding.dart';
import '../modules/product-detail/views/product_detail_view.dart';
import '../modules/product-edit/bindings/product_edit_binding.dart';
import '../modules/product-edit/views/product_edit_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/toko/bindings/toko_binding.dart';
import '../modules/toko/views/toko_view.dart';
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
      name: _Paths.ARTCLE_DETAIL,
      page: () => const ArtcleDetailView(),
      binding: ArtcleDetailBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_EDIT,
      page: () => const ProductEditView(),
      binding: ProductEditBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => const AddProductView(),
      binding: AddProductBinding(),
    ),
  ];
}
