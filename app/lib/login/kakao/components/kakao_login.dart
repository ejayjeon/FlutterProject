import 'package:app/common/layout/main_layout.dart';
import 'package:app/login/kakao/providers/kakao_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KakaoLogin extends ConsumerStatefulWidget {
  const KakaoLogin({super.key});

  @override
  ConsumerState<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends ConsumerState<KakaoLogin> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(kakaoLoginProvider);
    return MainLayout(
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('로그인'),
                onPressed: () async {
                  await state.login();
                  setState(() {});
                },
              ),
              Text('${state.isLogin}'),
              if (state.user?.kakaoAccount?.profile != null)
                Image.network(
                    state.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
              ElevatedButton(
                child: Text('로그아웃'),
                onPressed: () async {
                  await state.logout();
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
