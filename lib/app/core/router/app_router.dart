import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/middleware/auth_guard.dart';
import 'package:whoever/app/view/main/book_view.dart';
import 'package:whoever/app/view/main/chat_view.dart';
import 'package:whoever/app/view/main/home_view.dart';
import 'package:whoever/app/view/etc/intro_view.dart';
import 'package:whoever/app/view/etc/pin_view.dart';
import 'package:whoever/app/view/main/setting_view.dart';
import 'package:whoever/app/view/etc/signin_view.dart';

abstract class Routes {
  static const HOME = '/home';
  static const BOOK = '/book';
  static const INTRO = '/intro';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const PIN = '/pin';
  static const SETTING = '/setting';
  static const CHAT = '/chat';
}

class AppRouter {
  AppRouter._();
  static const initPath = Routes.INTRO;
  static final pages = <GetPage>[
    GetPage(
      name: Routes.INTRO,
      page: () => const IntroView(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
      middlewares: [
        AuthGuard(),
      ],
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => const SignInView(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.BOOK,
      page: () => const BookView(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => const ChatView(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.PIN,
      page: () => const PinView(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => const SettingView(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
    ),
  ];
}
