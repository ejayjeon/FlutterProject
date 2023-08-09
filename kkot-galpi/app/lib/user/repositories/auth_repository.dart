import 'package:app/common/models/response_model.dart';
import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/utils/encode.dart';
import 'package:app/common/utils/ip.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return AuthRepository(baseUrl: 'http://$ip/auth', dio: dio);
});

class AuthRepository {
  final String baseUrl;
  final Dio dio;

  AuthRepository({
    required this.baseUrl,
    required this.dio,
  });

  Future<LoginModel> login({
    required String userId,
    required String userPwd,
  }) async {
    final serialized = Encode.plainToBase64('$userId:$userPwd');

    final resp = await dio.post(
      '$baseUrl/login',
      options: Options(
        headers: {
          'authorization': 'Basic $serialized',
        },
      ),
    );
    return LoginModel.fromJson(
      resp.data,
    );
  }

  Future<TokenModel> token() async {
    final resp = await dio.post(
      '$baseUrl/token',
      options: Options(
        headers: {
          'refreshToken': 'true',
        },
      ),
    );
    return TokenModel.fromJson(
      resp.data,
    );
  }
}
