// Interceptor
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:whoever/common/di/storage_provider.dart';

// 똑같은 인스턴스
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  // Ref를 사용해서 또다른 프로바이더를 블러올 수 있다
  final storage = ref.watch(storageProvider);
  dio.interceptors.add(
    CustomInterceptors(storage: storage),
  );

  return dio;
});

class CustomInterceptors extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptors({
    required this.storage,
  });
// 1) 요청을 보낼 때
// dio 요청을 보내면 무조건 불림 : 이때 headers를 체크할 수 있음
// 만약에 요청 Header에 accessToken: true 값이 있다면
// 실제 토큰을 스토리지에서 가져와서 bearer Token을 가져와서 변경해준다
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] ${options.method} ${options.uri}');

    if (options.headers['accessToken'] == 'true') {
      // 헤더에서 accessToken을 삭제하고
      options.headers.remove('accessToken');

      // 새로 저장된 토큰을 읽어와서 토큰을 넣음
    }
    return super.onRequest(options, handler);
  }

// 2) 응답을 받을 때
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

// 3) 에러가 났을 때
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}
