import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_kakao_login/common/views/home_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'config/.env');
  KakaoSdk.init(
    nativeAppKey: dotenv.get(
      'KAKAO_NATIVE_APP_KEY',
      fallback: 'sane-default',
    ),
    javaScriptAppKey: dotenv.get(
      'KAKAO_REST_API_KEY',
      fallback: 'sane-default',
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
