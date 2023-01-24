import 'package:app/common/layout/main_layout.dart';
import 'package:app/login/kakao/providers/kakao_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KakaoLogin extends ConsumerWidget {
  const KakaoLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(kakaoLoginProvider);
    return MainLayout(
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('로그인'),
            onPressed: () {
              state.checkInstall();
            },
          ),
        ),
      ),
    );
  }
}
