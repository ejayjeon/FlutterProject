import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nosh/common/components/custom_elevated_btn.dart';
import 'package:nosh/common/components/custom_sized_box.dart';
import 'package:nosh/common/components/custom_text_form_field.dart';
import 'package:nosh/common/const/data.dart';
import 'package:nosh/common/layout/main_layout.dart';
import 'package:nosh/common/const/custom_theme.dart';
import 'package:nosh/common/provider/dio_provider.dart';
import 'package:nosh/common/provider/secure_storage_provider.dart';
import 'package:nosh/common/view/root_tab.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String get routeName => 'login';
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // Dart 에서 Base64로 변환하는 방법

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
                CustomSizedBox(height: 16.0),
                _Title(
                  title:
                      'Please enter your E-mail address and password. \nWish you having wonderful day 😁',
                  theme: Theme.of(context).textTheme.bodyText1,
                ),
                CustomSizedBox(height: 16.0),
                Image.asset(
                  'assets/images/misc/logo2.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                CustomSizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: 'Email',
                  obscure: false,
                  autoFocus: true,
                  prefixIcon: Icons.person,
                  onChanged: (String value) {
                    email = value;
                  },
                ),
                CustomSizedBox(height: 16.0),
                CustomTextFormField(
                  hintText: 'Password',
                  obscure: true,
                  autoFocus: true,
                  prefixIcon: Icons.lock,
                  onChanged: (String value) {
                    pwd = value;
                  },
                ),
                CustomSizedBox(height: 16.0),
                CustomElevatedBtn(
                  onPressed: () async {
                    final rawString = '$email:$pwd';
                    String token = stringToBase64.encode(rawString);
                    final dio = ref.read(dioProvider);
                    final resp = await dio.post(
                      'http://$ip/auth/login',
                      options: Options(
                        headers: {'authorization': 'Basic $token'},
                      ),
                    );
                    // 1. 발급받은 토큰 저장
                    final accessToken = resp.data['accessToken'];
                    final refreshToken = resp.data['refreshToken'];
                    final storage = ref.read(secureStorageProvider);
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
                CustomSizedBox(height: 16.0),
                CustomElevatedBtn(
                  onPressed: () async {},
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
