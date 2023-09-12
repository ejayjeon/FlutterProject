import 'package:get/route_manager.dart';
import 'package:whoever/app/app.dart';
import 'package:whoever/app/common/middleware/auth_guard.dart';
import 'package:whoever/app/controller/app_binding.dart';
import 'package:whoever/app/view/home/home_view.dart';
import 'package:whoever/app/view/intro/intro_view.dart';
import 'package:whoever/app/view/user/login_view.dart';

abstract class Routes {
  static const APP = '/';
  static const HOME = '/home';
  static const INTRO = '/intro';
  static const LOGIN = '/login';
}

class AppRouter {
  static const initPath = Routes.APP;
  static final pages = <GetPage>[
    // PageRedirect(),
    GetPage(
      middlewares: [
        AuthGuard(),
      ],
      name: Routes.APP,
      page: () => App(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => const IntroView(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),
  ];
}
