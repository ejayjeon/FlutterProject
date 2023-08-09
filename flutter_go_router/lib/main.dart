import 'package:flutter/material.dart';
import 'package:flutter_go_router/routes/router.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const RootScreen(),
      routerConfig: router,
    );
  }
}
