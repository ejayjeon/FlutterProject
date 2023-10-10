import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:whoever/app/core/util/utils.dart';

class DioService extends GetxService {
  // [DIO] DIO INIT
  DioService._init();
  static final _singleton = DioService._init();
  factory DioService() => _singleton;

  static Dio createDio({
    required String baseUrl,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        sendTimeout: const Duration(milliseconds: 30000),
      ),
    );
    dio.interceptors.addAll({CustomInterceptor(dio)});
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
