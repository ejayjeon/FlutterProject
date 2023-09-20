import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/middleware/auth_guard.dart';
import 'package:whoever/app/view/book_view.dart';
import 'package:whoever/app/view/chat_view.dart';
import 'package:whoever/app/view/home_view.dart';
import 'package:whoever/app/view/intro_view.dart';
import 'package:whoever/app/view/pin_view.dart';
import 'package:whoever/app/view/setting_view.dart';

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
  static const initPath = Routes.PIN;
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
      page: () => const HomeView(),
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

/**bool? participatesInRootNavigator,
  double Function(BuildContext)? gestureWidth,
  bool maintainState = true,
  Curve curve = Curves.linear,
  Alignment? alignment,
  Map<String, String>? parameters,
  bool opaque = true,
  Duration? transitionDuration,
  bool? popGesture,
  Bindings? binding,
  List<Bindings> bindings = const [],
  Transition? transition,
  CustomTransition? customTransition,
  bool fullscreenDialog = false,
  List<GetPage<dynamic>> children = const <GetPage>[],
  List<GetMiddleware>? middlewares,
  GetPage<dynamic>? unknownRoute,
  Object? arguments,
  bool showCupertinoParallax = true,
  bool preventDuplicates = true, */