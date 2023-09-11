import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:whoever/app/auth/service/auth_service.dart';
import 'package:whoever/app/common/routes/app_router.dart';
import 'package:whoever/app/common/service/preference_service.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/view/intro/intro_view.dart';

/**
 * Setting Router Guards
 */
class AuthGuard extends GetMiddleware {
  final pref = PrefererenceService().to.pref;
  @override
  // 인증 및 권한 부여 호출
  RouteSettings? redirect(String? route) {
    // isLogin : bool (default: false)
    if (pref.getBool('loginValid')!) {
      return const RouteSettings(
        name: Routes.HOME,
      );
    }
    if (!AuthService.to.isLogin) {
      return const RouteSettings(
        name: Routes.LOGIN,
      );
    }
    return null;
  }
}
