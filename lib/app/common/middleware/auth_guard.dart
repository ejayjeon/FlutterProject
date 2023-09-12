import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:whoever/app/service/auth_service.dart';
import 'package:whoever/app/common/routes/app_router.dart';
import 'package:whoever/app/service/storage_manager.dart';

/**
 * Setting Router Guards
 */
class AuthGuard extends GetMiddleware {
  // final pref = PrefererenceService().to.pref;
  @override
  // 인증 및 권한 부여 호출
  RouteSettings? redirect(String? route) {
    // isLogin : bool (default: false)
    if (StorageManager.getData('loginValid') != null) {
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
