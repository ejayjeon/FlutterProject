import 'package:flutter_kakao_login/kakao/providers/login_interface.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements ILogin {
  @override
  Future<bool> login() async {
    try {
      // 1. 카카오톡 installed 여부 확인
      bool isInstalled = await isKakaoTalkInstalled();
      // 1-1) 인스톨이 되어 있다면, 카카오톡으로 로그인 유도;
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print('kakaotalk 카카오톡 로그인 성공, ${isInstalled}');
          return true;
        } catch (e) {
          return false;
        }
      } else {
        // 1-2) 인스톨이 되어있지 않다면, 카카오 계정으로 로그인 유도
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('kakaoAccount 카카오톡 로그인 성공, ${isInstalled}');
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      print('카카오톡 로그아웃 성공');
      return true;
    } catch (e) {
      return false;
    }
  }
}
