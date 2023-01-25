import 'package:app/login/models/login_platform.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final naverLoginProvider = Provider((ref) => NaverViewModel(NaverLogin()));

class NaverViewModel {
  final ILoginPlatform _iLoginPlatform;
  NaverViewModel(this._iLoginPlatform);

  bool isLogin = false;
  List<NaverAccountResult>? info;

  Future<void> login() async {
    isLogin = await _iLoginPlatform.login();
    final NaverLoginResult res = await FlutterNaverLogin.logIn();

    if (res.status == NaverLoginStatus.loggedIn) {
      info = [res.account];
      isLogin = true;
      print('네이버 로그인 성공');
    }
  }

  Future<void> logout() async {
    await FlutterNaverLogin.logOut();
    isLogin = false;
    info = [];
  }
}

class NaverLogin implements ILoginPlatform {
  @override
  Future<bool> login() async {
    final NaverLoginResult res = await FlutterNaverLogin.logIn();

    if (res.status == NaverLoginStatus.loggedIn) {
      print('네이버 로그인 성공');
      return true;
    }
    return false;
  }

  @override
  Future<bool> logout() async {
    try {
      await FlutterNaverLogin.logOut();
      return true;
    } catch (error) {
      return false;
    }
  }
}
