import 'package:app/common/providers/router_provider.dart';
import 'package:app/common/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  // runApp() 호출 전에 WidgetBinding
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  KakaoSdk.init(
    nativeAppKey: dotenv.get(
      'KAKAO_NATIVE_APP_KEY',
      fallback: 'sane-default',
    ),
    javaScriptAppKey: dotenv.get(
      'KAKAO_JAVA_SCRIPT_KEY',
      fallback: 'sane-default',
    ),
  );
  runApp(
    const ProviderScope(
      child: _App(),
    ),
  );
}

class _App extends ConsumerWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      themeMode: customThemeMode,
      theme: lightThemeData,
      debugShowCheckedModeBanner: false,
      // 라우터 설정
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
