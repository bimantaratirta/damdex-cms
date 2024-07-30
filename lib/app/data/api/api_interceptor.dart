import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';

import '../../routes/app_pages.dart';

class APIInterceptor extends InterceptorsWrapper {
  APIInterceptor();

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
  //   return super.onRequest(options, handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final sc = err.response?.statusCode ?? 0;
    if (sc == 401) {
      if (Get.currentRoute != Routes.LOGIN) Get.offAllNamed(Routes.LOGIN);
      return super.onError(err, handler);
    } else {
      return super.onError(err, handler);
    }
  }
}
