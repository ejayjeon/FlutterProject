import 'package:app/common/views/home_screen.dart';
import 'package:app/common/views/splash_screen.dart';
import 'package:app/user/models/user_model.dart';
import 'package:app/user/providers/login_check_provider.dart';
import 'package:app/user/views/login_screen.dart';
import 'package:app/user/views/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authProvider = ChangeNotifierProvider((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({
    required this.ref,
  }) {
    ref.listen<UserModelBase?>(loginCheckProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: HomeScreen.routeName,
          builder: (_, __) => const HomeScreen(),
          routes: [
            GoRoute(
              name: 'user',
              path: 'user/:id',
              builder: (context, state) => const UserScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/splash',
          name: SplashScreen.routeName,
          builder: (_, __) => const SplashScreen(),
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.routeName,
          builder: (_, __) => const LoginScreen(),
        ),
      ];

  void logout() {
    ref.read(loginCheckProvider.notifier).logout();
  }

  // SplashScreen : 앱이 처음 시작했을 때, 토큰이 존재하는지 확인하고 로그인 스크린으로 보낼지 홈 스크린으로 보낼지 확인하는 과정
  String? redirectCheck(GoRouterState state) {
    final UserModelBase? user = ref.read(loginCheckProvider);

    final logginIn = (state.location == '/login');

    if (user == null) {
      return logginIn ? null : '/login';
    }

    // UserModel: 사용자 정보가 있는 상태면 로그인 중이거나 현재 위치가 SplachScreen일 경우 홈으로 이동
    if (user is UserModel) {
      return logginIn || state.location == '/splash' ? '/' : null;
    }

    // UserModel이 Error일 경우
    if (user is UserModelError) {
      return !logginIn ? '/login' : null;
    }

    return null;
  }
}
