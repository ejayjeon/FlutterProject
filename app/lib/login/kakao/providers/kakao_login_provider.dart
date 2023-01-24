import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final kakaoLoginProvider = Provider<KakaoLogin>((ref) => KakaoLogin());

class KakaoLogin {
  // 1. 애플리케이션 install 체크
  void checkInstall() async {
    bool inInstalled = await isKakaoTalkInstalled();

    OAuthToken token = inInstalled
        ? await UserApi.instance.loginWithKakaoTalk()
        : await UserApi.instance.loginWithKakaoAccount();
  }
}
