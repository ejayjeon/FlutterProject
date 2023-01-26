import 'dart:convert';
import 'dart:io';

import 'package:app/login/models/login_platform.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final kakaoLoginProvider =
    ChangeNotifierProvider((ref) => KakaoLogin(ref: ref));

class KakaoLogin extends ChangeNotifier {
  final Ref ref;

  final dio = Dio();

  KakaoLogin({
    required this.ref,
  });
  // 1. 애플리케이션 install 체크
  Future<OAuthToken> checkInstall() async {
    bool inInstalled = await isKakaoTalkInstalled();

    OAuthToken token = inInstalled
        ? await UserApi.instance.loginWithKakaoTalk()
        : await UserApi.instance.loginWithKakaoAccount();

    print('[Token] $token');
    return token;
  }

  void signInWithKakao() async {
    try {
      bool inInstalled = await isKakaoTalkInstalled();

      OAuthToken token = inInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      final url = Uri.https('kapi.kakao.com', '/v2/user/me');
      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );
      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());
    } catch (error) {
      //
    }
  }
}

class SampleScreen extends ConsumerStatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends ConsumerState<SampleScreen> {
  LoginPlatform _loginPlatform = LoginPlatform.kakao;

  void signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());

      setState(() {
        _loginPlatform = LoginPlatform.none;
      });
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.facebook:
        break;
      case LoginPlatform.google:
        break;
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.naver:
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _loginPlatform != LoginPlatform.none
              ? _logoutButton()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loginButton(
                      'kakao_logo',
                      signInWithKakao,
                    )
                  ],
                )),
    );
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return Card(
      elevation: 5.0,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Ink.image(
        image: AssetImage('asset/image/$path.png'),
        width: 60,
        height: 60,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(35.0),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget _logoutButton() {
    return ElevatedButton(
      onPressed: signOut,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color(0xff0165E1),
        ),
      ),
      child: const Text('로그아웃'),
    );
  }
}
