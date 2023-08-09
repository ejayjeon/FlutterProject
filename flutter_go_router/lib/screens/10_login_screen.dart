import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:flutter_go_router/routes/router.dart';
import 'package:go_router/go_router.dart';

// redirection 사용
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: ListView(
        children: [
          Text(authState.toString()),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // 라우터 파일에 선언된 변수
                authState = !authState;
              });
            },
            child: Text(
              authState ? 'logout' : 'login',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (GoRouterState.of(context).location == '/login') {
                context.go('/login/private');
              } else {
                context.go('/login2/private');
              }
            },
            child: Text('Go to private screen'),
          ),
        ],
      ),
    );
  }
}
