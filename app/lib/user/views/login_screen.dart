import 'package:app/common/common_screen.dart';
import 'package:app/common/components/custom_button.dart';
import 'package:app/common/components/custom_textform.dart';
import 'package:app/common/const/encoding.dart';
import 'package:app/common/const/storage.dart';
import 'package:app/common/layout/main_layout.dart';
import 'package:dio/dio.dart';
import 'package:app/common/const/ip.dart' as ip;
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String get routeName => 'login';
  final ValueNotifier themeNotifier;
  const LoginScreen({
    super.key,
    required this.themeNotifier,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String pwd = '';
  String token = '';
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return MainLayout(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _Title(title: '로그인'),
                const _SubTitle(subTitle: '디바이스 로그인'),
                Image.asset(
                  'assets/images/illu16.png',
                  width: MediaQuery.of(context).size.width / 3,
                ),
                CustomTextForm(
                  onChanged: (String value) {
                    email = value;
                  },
                  themeNotifier: widget.themeNotifier,
                  hint: '이메일을 입력해 주세요',
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextForm(
                  onChanged: (String value) {
                    pwd = value;
                  },
                  themeNotifier: widget.themeNotifier,
                  isPwd: true,
                  hint: '비밀번호를 입력해 주세요',
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  onPressed: () async {
                    final rawString = '$email:$pwd';
                    token = stringToBase64.encode(rawString);
                    final resp = await dio.post(
                      '${ip.path}/auth/login',
                      options: Options(
                        headers: {
                          'authorization': 'Basic $token',
                        },
                      ),
                    );
                    // 1. 입력받은 토큰 변수에 담기
                    final refreshToken = resp.data['refreshToken'];
                    final accressToken = resp.data['accressToken'];
                    // 2. 토큰을 secure_storage에 저장
                    await storage.write(
                      key: REFRESH_TOKEN_KEY,
                      value: refreshToken,
                    );
                    await storage.write(
                      key: ACCESS_TOKEN_KEY,
                      value: accressToken,
                    );
                    // 3. 만약에 토큰이 있으면 바로 넘어가도록
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CommonScreen(
                          themeNotifier: widget.themeNotifier,
                        ),
                      ),
                    );
                  },
                  buttonText: '로그인',
                  themeNotifier: widget.themeNotifier,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomButton(
                  onPressed: () async {},
                  buttonText: '취소',
                  subStyle: true,
                  themeNotifier: widget.themeNotifier,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  const _Title({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  final String subTitle;
  const _SubTitle({
    super.key,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(subTitle);
  }
}
