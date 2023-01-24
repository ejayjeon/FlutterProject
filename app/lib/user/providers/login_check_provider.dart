import 'package:app/common/providers/secure_storage_provider.dart';
import 'package:app/common/utils/token_key.dart';
import 'package:app/user/models/user_model.dart';
import 'package:app/user/repositories/auth_repository.dart';
import 'package:app/user/repositories/login_check_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final loginCheckProvider =
    StateNotifierProvider<LoginStateNotifier, UserModelBase?>((ref) {
  final loginCheckRepository = ref.watch(loginCheckRepositoryProvider);
  final storage = ref.watch(secureStorageProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  return LoginStateNotifier(
    storage: storage,
    repository: loginCheckRepository,
    authRepository: authRepository,
  );
});

class LoginStateNotifier extends StateNotifier<UserModelBase?> {
  final FlutterSecureStorage storage;
  final LoginCheckRepository repository;
  final AuthRepository authRepository;

  LoginStateNotifier({
    required this.storage,
    required this.repository,
    required this.authRepository,
  }) : super(UserModelLoading()) {
    getInfo();
  }

  Future<void> getInfo() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      state = null;
      return;
    }

    final resp = await repository.getInfo();

    state = resp;
  }

  Future<UserModelBase?> login({
    required String userId,
    required String userPwd,
  }) async {
    try {
      state = UserModelLoading();

      final resp = await authRepository.login(
        userId: userId,
        userPwd: userPwd,
      );
      await storage.write(key: REFRESH_TOKEN_KEY, value: resp.refreshToken);
      await storage.write(
        key: ACCESS_TOKEN_KEY,
        value: resp.accressToken,
      );

      final loginResp = await repository.getInfo();

      state = loginResp;
    } catch (error) {
      state = UserModelError(message: '로그인에 실패했습니다.');

      return Future.value(state);
    }
  }

  Future<void> logout() async {
    state = null;

    await Future.wait([
      storage.delete(key: REFRESH_TOKEN_KEY),
      storage.delete(key: ACCESS_TOKEN_KEY),
    ]);
  }
}
