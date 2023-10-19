import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whoever/common/di/theme_provider.dart';
import 'package:whoever/common/theme/custom_theme.dart';
import 'package:whoever/common/util/preference_util.dart';
import 'package:whoever/common/util/router.dart';
// import 'package:whoever/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _init();
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

void _init() async {
  print('initialize...');
  await PreferenceUtil.init();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightMode = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.customThemeData,
      darkTheme: ThemeData.dark(),
      themeMode: isLightMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: AppRoutes.router,
      // home: const HomeView(),
    );
  }
}
