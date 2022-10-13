import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/const/color_schemes.g.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/layout/main_layout.dart';
import 'package:nosh/common/provider/dio_provider.dart';
import 'package:nosh/common/provider/secure_storage_provider.dart';
import 'package:nosh/common/view/root_tab.dart';
import 'package:nosh/user/view/login_screen.dart';

import '../components/custom_sized_box.dart';

class SplachScreen extends ConsumerStatefulWidget {
  const SplachScreen({super.key});

  @override
  ConsumerState<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends ConsumerState<SplachScreen> {
  @override
  void initState() {
    // 앱이 처음 시작했을 때 토큰의 유무 확인
    super.initState();
    checkToken();
    // deleteToken();
  }

  void checkToken() async {
    // ref.watch : then the rebuilt dependent widget will not reflect the changes in the inherited widget
    final storage = ref.read(secureStorageProvider);
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    final dio = ref.read(dioProvider);
    try {
      final resp = await dio.post(
        'http://$ip/auth/token',
        options: Options(
          headers: {
            'authorization': 'Bearer $refreshToken',
          },
        ),
      );
      // 발급받은 AccessToken Storage에 저장
      await storage.write(
        key: ACCESS_TOKEN_KEY,
        value: resp.data['accessToken'],
      );
      // 에러가 나지 않으면 토큰이 발급되면서, 다음 페이지로 넘어감
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const RootTab(),
        ),
        (route) => false,
      );
    } catch (e) {
      // 만약에 상태코드가 200이 아니라면 에러
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  void deleteToken() async {
    final storage = ref.watch(secureStorageProvider);
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
            CustomSizedBox(height: 8.0),
            CircularProgressIndicator(
              color: lightColorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
