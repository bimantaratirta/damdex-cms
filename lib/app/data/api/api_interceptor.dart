import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';

import '../../routes/app_pages.dart';
import '../../utils/get_tokens copy.dart';

class APIInterceptor extends InterceptorsWrapper {
  final Dio _dio;

  APIInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final tokens = await getTokens();
    options.headers['Authorization'] = 'Bearer ${tokens.access}';
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final sc = err.response?.statusCode ?? 0;
    if (sc == 401 || sc == 400) {
      await onAccessExpired(err, handler);
    } else {
      return super.onError(err, handler);
    }
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) async {
  //   return super.onResponse(response, handler);
  // }

  Future<void> onAccessExpired(DioException err, ErrorInterceptorHandler handler) async {
    final tokens = await getTokens();
    final message = "${err.response?.data["message"]}";
    final isAccesExpired = message == "Akses token expired";
    final isRefreshExpired = message.contains("Waktu login sudah habis");
    final isPasswordChanged = message.contains("mengubah password");
    final isLibraryNonActive = message.contains("Perpustakaan tidak aktif");
    final isAccessTokenEmpty = tokens.access.toString().isEmpty || tokens.access == null;
    final isRefreshTokenEmpty = tokens.access.toString().isEmpty || tokens.access == null;
    final isTokensEmpty = isAccessTokenEmpty || isRefreshTokenEmpty;
    if (isRefreshExpired || isPasswordChanged || isTokensEmpty || isLibraryNonActive) {
      if (Get.currentRoute != Routes.LOGIN) {
        Get.offAllNamed(Routes.LOGIN);
      }
      return super.onError(err, handler);
    } else if (isAccesExpired) {
      try {
        // await refreshAccessToken();
        err.requestOptions.headers["Authorization"] = "Bearer ${tokens.access}";
        final opts = Options(method: err.requestOptions.method, headers: err.requestOptions.headers);
        final prevRequest = await _dio.request(
          err.requestOptions.path,
          options: opts,
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
        return handler.resolve(prevRequest);
      } on DioException catch (e) {
        return super.onError(e, handler);
      }
    } else {
      return super.onError(err, handler);
    }
  }

  // Future<void> refreshAccessToken() async {
  //   final oldTokens = await getTokens();
  //   final response = await _dio.post(
  //     APIPath.refresh,
  //     data: jsonEncode({"refreshToken": oldTokens.refresh}),
  //   );
  //   final sc = response.statusCode ?? 0;
  //   if (sc >= 200 && sc < 300) {
  //     final token = response.data['result']['token'];
  //     final access = token['accessToken'];
  //     final refresh = token['refreshToken'];
  //     final prefs = {"access": access, "refresh": refresh};
  //     await SharedPreferencesManager.writePrefs(prefs);
  //   }
  // }
}
