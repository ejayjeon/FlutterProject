import 'package:app/login/models/login_platform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final kakaoLoginProvider =
    Provider<KakaoViewModel>((ref) => KakaoViewModel(KakaoLogin()));

class KakaoViewModel {
  final ILoginPlatform _iLoginPlatform;
  KakaoViewModel(this._iLoginPlatform);

  // 1. 로그인 상태 체크하기
  bool isLogin = false;
  User? user;

  Future<void> login() async {
    isLogin = await _iLoginPlatform.login();

    if (isLogin) {
      // 로그인에 성공했으면 user에 정보 저장
      user = await UserApi.instance.me();
      print('[User] $user');
    }
  }

  Future<void> logout() async {
    await _iLoginPlatform.logout();
    isLogin = false;
    user = null;
  }
}

class KakaoLogin implements ILoginPlatform {
  // 1. 애플리케이션 install 체크
  @override
  Future<bool> login() async {
    try {
      // 1. 카카오톡 Install 여부 확인
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print('카카오톡 로그인 성공');
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오톡 로그인 성공');
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      print('카카오톡 로그아웃 성공');
      return true;
    } catch (err) {
      return false;
    }
  }
}
