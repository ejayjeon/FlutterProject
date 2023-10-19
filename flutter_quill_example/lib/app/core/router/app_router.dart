import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/presentation/binding/pin_binding.dart';
import 'package:whoever/app/core/middleware/auth_guard.dart';
import 'package:whoever/app/presentation/view/book/book_story_edit_view.dart';
import 'package:whoever/app/presentation/view/book/book_story_list_view.dart';
import 'package:whoever/app/presentation/view/book/book_test.dart';
import 'package:whoever/app/presentation/view/book/book_view.dart';
import 'package:whoever/app/presentation/view/main/chat_view.dart';
import 'package:whoever/app/presentation/view/main/home_view.dart';
import 'package:whoever/app/presentation/view/etc/intro_view.dart';
import 'package:whoever/app/presentation/view/etc/pin_view.dart';
import 'package:whoever/app/presentation/view/main/main_view.dart';
import 'package:whoever/app/presentation/view/setting/setting_detail_view.dart';
import 'package:whoever/app/presentation/view/setting/setting_view.dart';
import 'package:whoever/app/presentation/view/etc/signin_view.dart';

abstract class Routes {
  static const HOME = '/home';
  static const BOOK = '/book';
  static const INTRO = '/intro';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const PIN = '/pin';
  static const SETTING = '/setting';
  static const CHAT = '/chat';
  static const BOOK_STORY_EDIT = '/book_story_edit';
  static const BOOK_STORY_LIST = '/book_story_list';
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
      page: () => MainView(),
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
      children: <GetPage>[
        GetPage(
          name: Routes.BOOK_STORY_LIST,
          page: () => const BookStoryListView(),
        ),
        GetPage(
          name: Routes.BOOK_STORY_EDIT,
          page: () => const BookStoryEditView(),
        ),
        GetPage(
          name: '/:id',
          page: () => const BookTest(),
        ),
      ],
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
      binding: PinBinding(),
      participatesInRootNavigator: true,
      curve: Curves.easeInOut,
    ),
    GetPage(
        name: Routes.SETTING,
        page: () => const SettingView(),
        participatesInRootNavigator: true,
        curve: Curves.easeInOut,
        children: <GetPage>[
          GetPage(
            name: '/:index',
            page: () => const SettingDetailView(),
          ),
        ]),
  ];
}