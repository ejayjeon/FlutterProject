import 'package:app/common/layout/main_layout.dart';
import 'package:app/login/kakao/providers/kakao_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin extends ConsumerWidget {
  const KakaoLogin({super.key});

  void _get_user_info() async {
    try {
      User user = await UserApi.instance.me();
      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
    } catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(kakaoLoginProvider);
    return MainLayout(
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('로그인'),
            onPressed: () async {
              // state.signInWithKakao();
              if (await isKakaoTalkInstalled()) {
                try {
                  await UserApi.instance.loginWithKakaoTalk();
                  print('카카오톡으로 로그인 성공');
                  _get_user_info();
                } catch (error) {
                  print('카카오톡으로 로그인 실패 $error');

                  // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                  // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                  if (error is PlatformException && error.code == 'CANCELED') {
                    return;
                  }
                  // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                  try {
                    await UserApi.instance.loginWithKakaoAccount();
                    print('카카오계정으로 로그인 성공');
                    _get_user_info();
                  } catch (error) {
                    print('카카오계정으로 로그인 실패 $error');
                  }
                }
              } else {
                try {
                  await UserApi.instance.loginWithKakaoAccount();
                  print('카카오계정으로 로그인 성공');
                  _get_user_info();
                } catch (error) {
                  print('카카오계정으로 로그인 실패 $error');
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
