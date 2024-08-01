import 'dart:convert';

import 'package:dio/dio.dart';

import 'api_interceptor.dart';
import 'api_path.dart';

class APIParam<T> {
  final String path;
  final T Function(Map<String, dynamic>) fromJson;
  final Map<String, dynamic>? data;
  final FormData? formData;
  final Map<String, dynamic>? queryParameters;
  final Options? options;
  final Function(int, int)? onReceiveProgress;
  final Function(int, int)? onSendProgress;

  APIParam({
    required this.path,
    required this.fromJson,
    this.queryParameters,
    this.data,
    this.formData,
    this.options,
    this.onReceiveProgress,
    this.onSendProgress,
  });
}

class APIResponse<T> {
  Headers? headers;
  T? data;
  int? statusCode;
  dynamic error;

  APIResponse({
    this.headers,
    this.data,
    this.statusCode,
    this.error,
  });
}

enum ResponseStatus { normal, waiting, success, connectionError, serverError, notFound }

class APIClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: APIPath.base,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  ));

  APIClient() {
    _dio.interceptors.add(APIInterceptor());
    _dio.options.extra['withCredentials'] = true;
  }

  Future<APIResponse<T>> _responseHandler<T>(Response response, APIParam<T> param) async {
    final int sc = response.statusCode ?? 0;
    if (response.data.isNotEmpty) {
      final jsonBody = response.data is String ? json.decode(response.data) : response.data;
      final T data = param.fromJson(jsonBody['result'] ?? {});
      final APIResponse<T> result = APIResponse(
        headers: response.headers,
        data: data,
        error: null,
        statusCode: sc,
      );
      return result;
    } else {
      final APIResponse<T> result = APIResponse(
        data: param.fromJson({}),
        error: null,
        statusCode: sc,
      );
      return result;
    }
  }

  Future<APIResponse<T>> _errorHandler<T>(DioException e) async {
    if (e.response == null) {
      final APIResponse<T> result = APIResponse<T>(data: null, error: ResponseStatus.connectionError);
      return result;
    } else {
      final int sc = e.response!.statusCode ?? 0;
      final APIResponse<T> result = APIResponse<T>(data: null, error: e.response!.data, statusCode: sc);
      return result;
    }
  }

  Future<APIResponse<T>> get<T>(APIParam<T> param, [CancelToken? cancelToken]) async {
    try {
      final response = await _dio.get(
        param.path,
        data: param.data,
        queryParameters: param.queryParameters,
        options: param.options,
        cancelToken: cancelToken,
        onReceiveProgress: param.onReceiveProgress,
      );
      final APIResponse<T> result = await _responseHandler<T>(response, param);
      return result;
    } on DioException catch (e) {
      final APIResponse<T> error = await _errorHandler(e);
      return error;
    }
  }

  Future<APIResponse<T>> post<T>(APIParam<T> param, [CancelToken? cancelToken]) async {
    try {
      final response = await _dio.post(
        param.path,
        data: param.data ?? param.formData,
        queryParameters: param.queryParameters,
        options: param.options,
        cancelToken: cancelToken,
        onSendProgress: param.onSendProgress,
        onReceiveProgress: param.onReceiveProgress,
      );
      final APIResponse<T> result = await _responseHandler<T>(response, param);
      return result;
    } on DioException catch (e) {
      final APIResponse<T> error = await _errorHandler(e);
      return error;
    }
  }

  Future<APIResponse<T>> patch<T>(APIParam<T> param, [CancelToken? cancelToken]) async {
    try {
      final response = await _dio.patch(
        param.path,
        data: param.data,
        queryParameters: param.queryParameters,
        options: param.options,
        cancelToken: cancelToken,
        onSendProgress: param.onSendProgress,
        onReceiveProgress: param.onReceiveProgress,
      );
      final APIResponse<T> result = await _responseHandler<T>(response, param);
      return result;
    } on DioException catch (e) {
      final APIResponse<T> error = await _errorHandler(e);
      return error;
    }
  }

  Future<APIResponse<T>> put<T>(APIParam<T> param, [CancelToken? cancelToken]) async {
    try {
      final response = await _dio.put(
        param.path,
        data: param.data,
        queryParameters: param.queryParameters,
        options: param.options,
        cancelToken: cancelToken,
        onSendProgress: param.onSendProgress,
        onReceiveProgress: param.onReceiveProgress,
      );
      final APIResponse<T> result = await _responseHandler<T>(response, param);
      return result;
    } on DioException catch (e) {
      final APIResponse<T> error = await _errorHandler(e);
      return error;
    }
  }

  Future<APIResponse<T>> delete<T>(APIParam<T> param, [CancelToken? cancelToken]) async {
    try {
      final response = await _dio.delete(
        param.path,
        data: param.data,
        queryParameters: param.queryParameters,
        options: param.options,
        cancelToken: cancelToken,
      );
      final APIResponse<T> result = await _responseHandler<T>(response, param);
      return result;
    } on DioException catch (e) {
      final APIResponse<T> error = await _errorHandler(e);
      return error;
    }
  }

  Future<APIResponse> download<T>({required APIParam<T> param, required String savePath, CancelToken? cancelToken}) async {
    try {
      final response = await _dio.download(
        param.path,
        savePath,
        queryParameters: param.queryParameters,
        cancelToken: cancelToken,
        data: param.data,
        options: param.options,
        onReceiveProgress: param.onReceiveProgress,
      );
      final APIResponse<T> result = APIResponse(
        data: null,
        error: null,
        statusCode: response.statusCode,
      );
      return result;
    } on DioException catch (e) {
      final APIResponse<T> error = await _errorHandler(e);
      return error;
    }
  }
}

final APIClient apiClient = APIClient();
