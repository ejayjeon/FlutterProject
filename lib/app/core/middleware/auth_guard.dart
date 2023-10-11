import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/data/service/pref_service.dart';
import 'package:whoever/app/data/service/user_service.dart';

class AuthGuard extends GetMiddleware {
  final userService = Get.find<UserService>();
  @override
  RouteSettings? redirect(String? route) {
    if (PrefManager.getData('loginValid') != null) {
      return const RouteSettings(
        name: Routes.PIN,
      );
    }

    if (!userService.isLogin) {
      return const RouteSettings(
        name: Routes.SIGNIN,
      );
    }
    return null;
  }
}
