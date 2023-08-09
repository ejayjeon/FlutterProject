import 'package:app/common/providers/dio_provider.dart';
import 'package:app/common/utils/ip.dart';
import 'package:app/user/models/user_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'login_check_repository.g.dart';

final loginCheckRepositoryProvider = Provider<LoginCheckRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return LoginCheckRepository(dio, baseUrl: 'http://$ip/login/check');
});

@RestApi()
abstract class LoginCheckRepository {
  factory LoginCheckRepository(Dio dio, {String baseUrl}) =
      _LoginCheckRepository;

  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<UserModel> getInfo();
}
