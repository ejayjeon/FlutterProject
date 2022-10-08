import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nosh/common/const/color_schemes.g.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/layout/main_layout.dart';
import 'package:nosh/common/view/root_tab.dart';
import 'package:nosh/user/view/login_screen.dart';

import '../components/custom_sized_box.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    // 앱이 처음 시작했을 때 토큰의 유무 확인
    super.initState();
    checkToken();
    // deleteToken();
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
        (route) => false,
      );
    } else {
      // 만약에 토큰이 하나라도 있다면 -> 원래는 인증로직 거쳐야함
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const RootTab(),
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
      backgroundColor: lightColorScheme.primaryContainer,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/misc/logo2.png',
              width: MediaQuery.of(context).size.width,
            ),
            customSizedBox(),
            CircularProgressIndicator(
              color: lightColorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
