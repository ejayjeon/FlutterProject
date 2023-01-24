import 'package:app/common/views/error_screen.dart';
import 'package:app/user/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final provider = ref.read(authProvider);
  return GoRouter(
    routes: provider.routes,
    initialLocation: '/',
    refreshListenable: provider,
    errorBuilder: (context, state) => const ErrorScreen(),
  );
});
