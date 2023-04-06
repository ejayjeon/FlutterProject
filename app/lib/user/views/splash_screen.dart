import 'package:app/common/common_screen.dart';
import 'package:app/common/const/ip.dart' as ip;
import 'package:app/common/const/storage.dart';
import 'package:app/common/layout/main_layout.dart';
import 'package:app/common/theme/color_schemes.g.dart';
import 'package:app/user/views/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

/** 
 * 앱이 처음 실행되었을 때, 이 화면에서 Token을 가지고 있는지 없는지 확인할 것 
 * 1. initState에서 token의 유무를 check한다
*/
class SplashScreen extends StatefulWidget {
  static String get routeName => 'splash';
  final ValueNotifier themeNotifier;
  const SplashScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    deleteToken();
    checkToken();
  }

// initState는 await을 할 수 없어서 일반 함수 생성
  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
// Dio로 토큰 가져와서 확인하기
    try {
      final resp = await dio.post(
        '${ip.path}/auth/token',
        options: Options(
          headers: {
            'content-type': 'application/json',
            'authorization': 'Bearer $refreshToken',
          },
        ),
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen(
            themeNotifier: widget.themeNotifier,
          ),
        ),
        (route) => false,
      );
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => CommonScreen(
            themeNotifier: widget.themeNotifier,
          ),
        ),
        (route) => false,
      );
    }
  }

  void deleteToken() async {
    await storage.deleteAll();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      backgroundColor: widget.themeNotifier.value == ThemeMode.light
          ? lightColorScheme.onBackground
          : darkColorScheme.onBackground,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/avatar9.png',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 16.0,
            ),
            CircularProgressIndicator(
              color: widget.themeNotifier.value == ThemeMode.light
                  ? lightColorScheme.primary
                  : darkColorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
