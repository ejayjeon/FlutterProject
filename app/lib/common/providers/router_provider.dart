import 'package:app/common/views/error_screen.dart';
import 'package:app/common/views/home_screen.dart';
import 'package:app/user/views/user_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomeScreen(),
        // Child Router
        routes: [
          GoRoute(
            name: 'user',
            path: 'user/:id',
            builder: (context, state) => const UserScreen(),
          )
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
});
