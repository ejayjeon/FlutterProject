import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class TransitionScreen1 extends StatelessWidget {
  const TransitionScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: Container(
        color: Colors.amber,
        child: ListView(
          children: [
            // 나의 path의 동적인 :id 값을 가져오는 라우터
            Text('${GoRouterState.of(context).pathParameters}'),
            ElevatedButton(
              onPressed: () {
                context.go('/transition/detail');
              },
              child: Text('Go To Detail'),
            ),
          ],
        ),
      ),
    );
  }
}
