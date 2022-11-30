import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nosh/common/view/root_tab.dart';
import 'package:nosh/common/view/splash_screen.dart';
import 'package:nosh/restaurant/view/restaurant_detail_screen.dart';
import 'package:nosh/user/model/user_model.dart';
import 'package:nosh/user/provider/user_me_provider.dart';
import 'package:nosh/user/view/login_screen.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(ref: ref);
});

class AuthProvider extends ChangeNotifier {
  final Ref ref;

  AuthProvider({
    required this.ref,
  }) {
    ref.listen<UserModelBase?>(userMeProvider, (previous, next) {
      // userMeProvider에서 이전 값과 next 값이 다를 때에만
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: RootTab.routeName,
          builder: (_, __) => RootTab(),
          routes: [
            GoRoute(
                path: 'restaurant/:rid',
                builder: (_, state) =>
                    RestaurantDetailScreen(id: state.params['rid']!)),
          ],
        ),
        GoRoute(
          path: '/splash',
          name: SplachScreen.routeName,
          builder: (_, __) => SplachScreen(),
        ),
        GoRoute(
          path: '/login',
          name: LoginScreen.routeName,
          builder: (_, __) => LoginScreen(),
        ),
      ];

// SplashScreen : 앱을 처음 시작했을 때 토큰이 존재하는지 확인하고 로그인 스크린으로 보내줄지 홈 스크린으로 보내줄지 확인하는 과정이 필요
  String? redirectLogic(GoRouterState state) {
    final logginIn = state.location == '/login';
    final UserModelBase? user = ref.read(userMeProvider);

    // 1. user가 null인데 로그인 중이면 그대로 로그인 페이지에 두고
    if (user == null) {
      return logginIn ? null : '/login';
    }
    // 1-2. 만약 로그인 중이 아니라면 로그인 페이지로 이동

    // 2. user가 null이 아님
    // 2-1. userModel 사용자 정보가 있는 상태면, 로그인 중이거나 현재 위치가 splashScreen이면 홈으로 이동

    if (user is UserModel) {
      return logginIn || state.location == '/splash' ? '/' : null;
    }

    // 3. userModel 에러
    if (user is UserModelError) {
      return !logginIn ? '/login' : null;
    }

    return null;
  }
}
