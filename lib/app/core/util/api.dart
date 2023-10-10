import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:whoever/app/core/util/utils.dart';

class Api {
  // [DIO] DIO INIT
  Api._init();
  static final _singleton = Api._init();
  factory Api() => _singleton;

  final dio = createDio();
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        // baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        sendTimeout: const Duration(milliseconds: 30000),
      ),
    );
    dio.interceptors.addAll({ErrorInterceptor(dio)});
    return dio;
  }

  // [TOKEN]
  String _token = '';
  String get token => _token;
  set token(String? value) {
    if (value != null && value.isNotEmpty) {
      _token = value;
    }
  }

  // [API KEY]
  String _apiKey = '';
  String get apiKey => _apiKey;
  set apiKey(String? value) {
    if (value != null && value.isNotEmpty) {
      _apiKey = value;
    }
  }

  // [Clear]
  clearKeyToken() {
    _token = '';
    _apiKey = '';
  }

// [GET]
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
  }) async {
    if (addRequestInterceptor) {
      dio.interceptors.add(
        RequestInterceptor(dio, apiKey: apiKey, token: token),
      );
    }
    return await dio.get(
      dio.options.baseUrl + path,
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
      options: options,
      queryParameters: queryParameters,
    );
  }

  // [POST]
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool addRequestInterceptor = true,
  }) async {
    if (addRequestInterceptor) {
      dio.interceptors.add(
        RequestInterceptor(dio, apiKey: apiKey, token: token),
      );
    }
    return await dio.post(
      dio.options.baseUrl + path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
    );
  }
}

class ErrorInterceptor extends Interceptor {
  final Dio dio;

  ErrorInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log('[ERR ${err.response?.statusCode}]');
    switch (err.response?.statusCode) {
      case 400:
        throw DioException(requestOptions: err.requestOptions);
      case 401:
        throw UnauthorizedException();
      case 404:
        throw PathNotFoundException(err.requestOptions.path, OSError());
      case 500:
        throw Exception(err.requestOptions);
      default:
        break;
    }
    return handler.next(err);
  }
}

class CustomInterceptor extends Interceptor {
  final Dio dio;
  // final String apiKey;
  // final String token;

  CustomInterceptor(
    this.dio,
    // this.apiKey,
    // this.token,
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log('[ERR ${err.response?.statusCode}]');
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Log('[REQ${options.method}] PATH: ${options.path}}');
    // options.headers = {
    //   'apiKey': apiKey,
    //   'token': token,
    // };
    // super.onRequest(options, handler);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Log('[RES ${response.statusCode}] PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }
}

class RequestInterceptor extends Interceptor {
  final Dio dio;
  final String apiKey;
  final String token;

  RequestInterceptor(this.dio, {required this.token, required this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {'apiKey': apiKey, 'token': token};
    return handler.next(options);
  }
}
