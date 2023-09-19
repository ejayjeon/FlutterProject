import 'package:get/get.dart';
import 'package:whoever/app/app.dart';
import 'package:whoever/app/controller/app_binding.dart';
import 'package:whoever/app/core/middleware/auth_guard.dart';
import 'package:whoever/app/view/book_view.dart';
import 'package:whoever/app/view/home_view.dart';
import 'package:whoever/app/view/intro_view.dart';
import 'package:whoever/app/view/pin_view.dart';
import 'package:whoever/app/view/setting_view.dart';

abstract class Routes {
  static const APP = '/';
  static const HOME = '/home';
  static const BOOK = '/book';
  static const INTRO = '/intro';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const PIN = '/pin';
  static const SETTING = '/setting';
}

class AppRouter {
  AppRouter._();
  static const initPath = Routes.PIN;
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
      // children: <GetPage>[
      //   GetPage(
      //     name: Routes.HOME,
      //     page: () => const HomeView(),
      //   ),
      // ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.BOOK,
      page: () => const BookView(),
    ),
    GetPage(
      name: Routes.PIN,
      page: () => const PinView(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => const SettingView(),
    ),
  ];
}
