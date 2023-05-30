import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PushScreen extends StatelessWidget {
  const PushScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: ListView(
        children: [
          // 현재 라우터가 생성되어있는 상태 그 위에 라우터를 쌓는 느낌
          ElevatedButton(
            onPressed: () {
              context.pushNamed('Basic');
            },
            child: Text('Push Basic'),
          ),
          // go - 첫 번째 라우터(상위) 라우터 위에 새로 라우터를 생성함
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: Text('Go Basic'),
          ),
        ],
      ),
    );
  }
}
