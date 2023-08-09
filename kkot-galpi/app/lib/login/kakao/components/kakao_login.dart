import 'package:app/api/providers/kakao_book_api_provider.dart';
import 'package:app/api/providers/ko_gpt_api_provider.dart';
import 'package:app/common/layout/main_layout.dart';
import 'package:app/login/kakao/providers/kakao_login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin extends ConsumerStatefulWidget {
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
  ConsumerState<KakaoLogin> createState() => _KakaoLoginState();
}

class _KakaoLoginState extends ConsumerState<KakaoLogin> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(kakaoLoginProvider);
    final state2 = ref.watch(kakaoBookApiProvider);
    return MainLayout(
      body: Container(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('카카오 로그인'),
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
                child: Text('카카오 로그아웃'),
                onPressed: () async {
                  await state.logout();
                  setState(() {});
                },
              ),
              ElevatedButton(
                child: Text('카카오 Book'),
                onPressed: () async {
                  // ref.read(koGPTProvider.notifier).koGPTApi();
                  await state2.getBookList('사피엔스');
                  // setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
