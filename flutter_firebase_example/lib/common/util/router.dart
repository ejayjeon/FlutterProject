import 'package:go_router/go_router.dart';
import 'package:whoever/common/util/app_data.dart';
import 'package:whoever/presentation/view/root_view.dart';

abstract class RouterPath {
  RouterPath._();
  static const ROOT = '/';
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
}

class AppRoutes {
  AppRoutes._();
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    // redirect: (context, state) {
    //   if (!AppData.isAuthState) {
    //     return RouterPath.SIGNIN;
    //   }
    //   return null;
    // },
    routes: <RouteBase>[
      GoRoute(
        path: RouterPath.ROOT,
        builder: (_, __) => const RootView(),
      ),
    ],
  );
}
