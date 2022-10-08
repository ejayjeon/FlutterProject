import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nosh/common/components/custom_elevated_btn.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/components/custom_text_form_field.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/layout/main_layout.dart';
import 'package:nosh/common/const/custom_theme.dart';
import 'package:nosh/common/view/root_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Dart 에서 Base64로 변환하는 방법
  final dio = Dio();
  // 안드로이드 에뮬과 시뮬 path는 다르다 별도로 설정해 주어야 함
  static const emulatorIp = '10.0.2.2:3000';
  static const simulatorIp = '127.0.0.1:3000';
  // IOS 와 Android 구분하는 방법
  final ip = Platform.isIOS ? simulatorIp : emulatorIp;

  String email = '';
  String pwd = '';
  String tokenData = '';
  Codec<String, String> stringToBase64 = utf8.fuse(base64);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        // 드래그하는 순간에 키보드가 사라짐 (UI가 편해짐  꿀팁)
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(
                  title: 'WELCOME TO NOSH',
                  theme: Theme.of(context).textTheme.headline2,
                ),
                customSizedBox(),
                _Title(
                  title:
                      'Please enter your E-mail address and password. \nWish you having wonderful day 😁',
                  theme: Theme.of(context).textTheme.bodyText1,
                ),
                customSizedBox(),
                Image.asset(
                  'assets/images/misc/logo2.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                customSizedBox(),
                CustomTextFormField(
                  hintText: 'Email',
                  obscure: false,
                  autoFocus: true,
                  prefixIcon: Icons.person,
                  onChanged: (String value) {
                    email = value;
                  },
                ),
                customSizedBox(),
                CustomTextFormField(
                  hintText: 'Password',
                  obscure: true,
                  autoFocus: true,
                  prefixIcon: Icons.lock,
                  onChanged: (String value) {
                    pwd = value;
                  },
                ),
                customSizedBox(),
                CustomElevatedBtn(
                  onPressed: () async {
                    final rawString = '$email:$pwd';
                    String token = stringToBase64.encode(rawString);
                    print('$rawString');
                    final resp = await dio.post(
                      'http://$ip/auth/login',
                      options: Options(
                        headers: {'authorization': 'Basic $token'},
                      ),
                    );
                    // 1. 발급받은 토큰 저장
                    final accessToken = resp.data['accessToken'];
                    final refreshToken = resp.data['refreshToken'];

                    await storage.write(
                        key: REFRESH_TOKEN_KEY, value: refreshToken);
                    await storage.write(
                        key: ACCESS_TOKEN_KEY, value: accessToken);
                    // 2. 화면이동
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RootTab(),
                      ),
                    );
                    print(resp.data);
                  },
                  child: const Text('SIGN IN'),
                ),
                customSizedBox(),
                CustomElevatedBtn(
                  onPressed: () async {
                    final resp = await dio.post(
                      'http://$ip/auth/token',
                      options: Options(
                        headers: {
                          'authorization': 'Bearer $tokenData.refreshtoken'
                        },
                      ),
                    );
                  },
                  backgroundColor: Colors.transparent,
                  child: const Text('SIGN UP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    super.key,
    required this.title,
    this.theme,
  });

  final String title;
  final TextStyle? theme;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: theme,
    );
  }
}
