import 'package:flutter/material.dart';
import 'package:flutter_kakao_login/common/layout/main_layout.dart';
import 'package:flutter_kakao_login/kakao/models/view_model.dart';
import 'package:flutter_kakao_login/kakao/providers/kakao_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // _iLogin을 상속받은 KakaoLogin()
  final viewModel = ViewModel(KakaoLogin());
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: '카카오 로그인',
      body: Center(
        child: Column(
          children: [
            if (viewModel.user?.kakaoAccount?.profile?.profileImageUrl != null)
              Image.network(
                  viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text('${viewModel.isLogined}'),
            ElevatedButton(
              onPressed: () async {
                await viewModel.login();
                setState(() {
                  // 로그인 후에 화면 갱신
                });
              },
              child: const Text(
                '카카오 로그인',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                setState(() {
                  // 로그아웃 후에 화면 갱신
                });
              },
              child: const Text(
                '카카오 로그아웃',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
