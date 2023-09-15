import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/service/pref_service.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // if (PrefManager.getData(key))
    return const RouteSettings(
      name: Routes.APP,
    );
  }
}
