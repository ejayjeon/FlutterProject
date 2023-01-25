import 'package:flutter_kakao_login/kakao/providers/login_interface.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class ViewModel {
  final ILogin _iLogin;
  ViewModel(this._iLogin);

  // 1. 로그인 상태 체크
  bool isLogined = false;

  // 2. 카카오톡의 User 정보 가져오기
  User? user;
  // 3. 로그인 기능
  login() async {
    print('로그인 성공');
    isLogined = await _iLogin.login();
    // 3-1) 로그인이 성공했다면
    if (isLogined) {
      user = await UserApi.instance.me();
      print(user?.kakaoAccount?.profile?.profileImageUrl);
    }
  }

  Future logout() async {
    await _iLogin.logout();
    isLogined = false;
    user = null;
  }
}
