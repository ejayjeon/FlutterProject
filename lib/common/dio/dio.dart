import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nosh/common/const/data.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });
// 인터셉터 기능
// 1) 요청 보낼 때 : 요청이 보내질 때마다 만약 요청의 header에 accessToken: true 값이 있다면 (매번 토큰을 넣을 수 없으니까, 헤더를 자동으로 적용), 이 값을 들고 있다면 헤더를 변경한다 (요청을 보내기 전에 )
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ], [${options.method}] ${options.uri}');
    // 토큰을 자동으로 적용하는 코드
    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');
      // 헤더 삭제 -> 실제 토큰으로 대체

      final token = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

// 리프레시 토큰을 자동으로 선별해서 집어넣는 코드
    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken');

      final token = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $token',
      });
    }

    return super.onRequest(options, handler);
    // 핸들러를 가지고 요청을 보낼지 보내지 않을지
  }

// 2) 응답 받을 때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

// 3) 에러가 났을 때
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print('[ERR], [${err.requestOptions.method}] ${err.requestOptions.uri}');

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    // Refresh Token이 없으면 에러를 던진다. handler.reject 사용한다
    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    // 요청을 보낸 주소가 auth/token이었는데 에러가 났다면, 토큰 자체에 문제가 있다는 소리
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();

      try {
        final resp = await dio.post(
          'http://$ip/auth/token',
          options: Options(
            headers: {
              'authorization': 'Bearer $refreshToken',
            },
          ),
        );

        final accessToken = resp.data['accessToken'];
        final options = err.requestOptions;

        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });

        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        //  에러가 발생했다면, 원래 요청을 토큰만 새로 발급시킨 다음에 다시 요청
        final response = await dio.fetch(options);
        return handler.resolve(response); // 에러는 났지만, 실제로는 에러가 나지 않은 것처럼
      } on DioError catch (e) {
        return handler.reject(e);
      }
    }

    // 토큰이 문제가 있을 때 [401]
    // 토큰을 재발급 받는 시도를 하고, 토큰이 재발급되면
    // 다시 새로운 토큰으로 요청을 한다.
    // return super.onError(err, handler);
    return handler.reject(err);
  }
}

/**
 * 에러가 났을 때, 일단 401 status 코드를 던지면, /auth/token 이라는 url에 접근하다가 난 에러라면 다시 토큰을 발급받는 과정을 거친다.
 * 
 * 만약에 401 에러를 받았고, 토큰을 새로 발급받으려던 경우가 아니라면 ? 토큰에서 문제가 발생한 것이기 때문에, 자동으로 /auth/token에 접근한 다음에 response를 받아와서 기존의 토큰을 대체해 버린다. 
 * 
 * 다시 받아온 토큰을 저장하고 요청이 완성을 하면, 응답이 제대로 온다. 그렇다면 사실 에러가 없었다는 의미로 handler.resolve(response) -> 에러가 없었다는 것처럼 보임
 */