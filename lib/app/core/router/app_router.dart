import 'package:get/get.dart';
import 'package:whoever/app/app.dart';
import 'package:whoever/app/controller/app_binding.dart';
import 'package:whoever/app/core/middleware/auth_guard.dart';
import 'package:whoever/app/view/home_view.dart';
import 'package:whoever/app/view/intro_view.dart';

abstract class Routes {
  static const APP = '/';
  static const HOME = '/home';
  static const INTRO = '/intro';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
}

class AppRouter {
  AppRouter._();
  static const initPath = Routes.INTRO;
  static final pages = <GetPage>[
    GetPage(
      middlewares: [
        AuthGuard(),
      ],
      name: Routes.INTRO,
      page: () => const IntroView(),
    ),
    GetPage(
      name: Routes.APP,
      page: () => App(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),
  ];
}
