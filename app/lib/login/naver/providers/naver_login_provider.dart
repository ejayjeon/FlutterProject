import 'dart:convert';

import 'package:app/login/models/login_platform.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:uuid/uuid.dart';

final naverLoginProvider = Provider((ref) => NaverViewModel(NaverLogin()));

class NaverViewModel {
  final ILoginPlatform _iLoginPlatform;
  NaverViewModel(this._iLoginPlatform);

  bool isLogin = false;
  List<NaverAccountResult>? info;

  Future<void> login() async {
    final clientUuid = Uuid().v4();
    final dio = Dio();
    print('[!!!!!!!!!!!res] $clientUuid');
    // final authUri = Uri.https(
    //   'nid.naver.com',
    //   '/oauth2.0/authorize',
    //   {
    //     'response_type': 'code',
    //     'client_id': dotenv.get('OAUTH_CLIENT_ID'),
    //     'response_mode': 'form_post',
    //     'redirect_url': 'http://localhost:8000/naver/login',
    //     'state': clientUuid,
    //   },
    // );

    // final authResponse = await FlutterWebAuth.authenticate(
    //   url: authUri.toString(),
    //   callbackUrlScheme: 'webauthcallback',
    // );

    // final code = Uri.parse(authResponse).queryParameters['code'];
    // final tokenUri = Uri.https('nid.naver.com', '/oauth2.0/token', {
    //   'grant_type': 'authorization_code',
    //   'client_id': dotenv.get('OAUTH_CLIENT_ID'),
    //   'client_secret': dotenv.get('OAUTH_CLIENT_SECRET'),
    //   'code': code,
    //   'state': clientUuid,
    // });
    // var tokenResult = await dio.post(
    //   tokenUri.toString(),
    // );

    // final accessToken = json.decode(tokenResult.data)['access_token'];
    // final response = await dio.get(
    //   Uri.parse('http://localhost:8000/naver/token?accessToken=$tokenUri')
    //       .toString(),
    // );
    isLogin = await _iLoginPlatform.login();
    final NaverLoginResult res = await FlutterNaverLogin.logIn();

    if (res.status == NaverLoginStatus.loggedIn) {
      info = [res.account];
      isLogin = true;
      print('네이버 로그인 성공');
    }

    // return response.data;
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
