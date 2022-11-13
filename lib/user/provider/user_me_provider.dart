import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/user/model/user_model.dart';
import 'package:nosh/user/repository/auth_repository.dart';
import 'package:nosh/user/repository/user_me_repository.dart';

class UserMeStateNotifier extends StateNotifier<UserModelBase?> {
  final UserMeRepository repository;
  final FlutterSecureStorage storage;
  final AuthRepository authRepository;

  UserMeStateNotifier({
    required this.repository,
    required this.storage,
    required this.authRepository,
  }) : super(UserModelLoading()) {
    getMe();
  }

// 내 정보 가져오기
  Future<void> getMe() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

// 만약에 위의 토큰들이 null이면 그냥 return
    if (refreshToken == null || accessToken == null) {
      state = null; // 로그오프상태
      return;
    }

// 성공적으로 데이터를 가지고오면 getMe()함수에서 userModel을 반환해주기 때문에, state에 이 userModel을 넣는 것
    final resp = await repository.getMe();

    state = resp;
  }

// 로그인을 시도했는데 로그인이 안될 수도 있어서 base를 받음
  Future<UserModelBase> login({
    required String userName,
    required String password,
  }) async {
    try {
      state = UserModelLoading();

      final resp = await authRepository.login(
        userName: userName,
        password: password,
      );

// 응답받아서 새로운 토큰을 storage에 넣어준다
      await storage.write(key: REFRESH_TOKEN_KEY, value: resp.refreshToken);
      await storage.write(key: ACCESS_TOKEN_KEY, value: resp.accessToken);

// 토큰을 확인하고, 내 유저정보를 가지고 온다. 유효한 토큰인지 확인
      final userResp = await repository.getMe();
      state = userResp;

      return userResp;
    } catch (e) {
      state = UserModelError(message: '로그인에 실패했습니다');

      return Future.value(state);
    }
  }

  Future<void> logout() async {
    state = null;

    // 두 개의 future 동시에 실행
    await Future.wait([
      storage.delete(key: REFRESH_TOKEN_KEY),
      storage.delete(key: REFRESH_TOKEN_KEY),
    ]);
  }
}
