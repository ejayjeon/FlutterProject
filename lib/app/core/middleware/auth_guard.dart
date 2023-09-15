import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';

class AuthGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return const RouteSettings(
      name: Routes.APP,
    );
  }
}
