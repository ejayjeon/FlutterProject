import 'package:app/common/common_screen.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:app/home/views/home_screen.dart';
import 'package:app/user/views/login_screen.dart';
import 'package:app/user/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // runApp 시작 전에 위젯 바인딩을 보증
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

// 라이트테마, 다크테마 설정
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currMode, __) {
        mode(currMode);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: darkThemeData,
          themeMode: currMode,
          theme: lightThemeData,
          home: SplashScreen(
            themeNotifier: themeNotifier,
          ),
        );
      },
    );
  }
}
