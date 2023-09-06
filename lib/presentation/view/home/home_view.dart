import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whoever/common/di/theme_provider.dart';
import 'package:whoever/common/layout/main_layout.dart';
import 'package:whoever/common/util/router.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MainLayout(
      appBarTitle: RouterPath.HOME,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            value: themeMode,
            onChanged: (value) {
              ref.read(themeProvider.notifier).toggle();
            },
          ),
        ],
      ),
    );
  }
}
