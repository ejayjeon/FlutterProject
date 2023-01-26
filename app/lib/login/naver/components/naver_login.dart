import 'package:app/common/layout/main_layout.dart';
import 'package:app/login/naver/providers/naver_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NaverLogin extends ConsumerStatefulWidget {
  const NaverLogin({super.key});

  @override
  ConsumerState<NaverLogin> createState() => _NaverLoginState();
}

class _NaverLoginState extends ConsumerState<NaverLogin> {
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(naverLoginProvider);
    return MainLayout(
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('네이버 로그인'),
                onPressed: () async {
                  // await state.login();
                  setState(() {});
                },
              ),
              // Text('${state.isLogin}'),
              ElevatedButton(
                child: Text('네이버 로그아웃'),
                onPressed: () async {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
