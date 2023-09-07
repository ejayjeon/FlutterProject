import 'package:get/route_manager.dart';
import 'package:whoever/app/app.dart';
import 'package:whoever/app/controller/app_binding.dart';
import 'package:whoever/app/view/home/home_view.dart';

abstract class Routes {
  static const APP = '/';
  static const HOME = '/home';
}

class AppRouter {
  static const initPath = Routes.APP;
  static final pages = <GetPage>[
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
