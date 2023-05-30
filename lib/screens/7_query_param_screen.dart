import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

// 정의가 path내에 있지 않아
// /query_param?name=hello&age=12
class QueryParamScreen extends StatelessWidget {
  const QueryParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: ListView(
        children: [
          // 나의 path의 동적인 :id 값을 가져오는 라우터
          Text('Path Param: ${GoRouterState.of(context).queryParameters}'),
          ElevatedButton(
            onPressed: () {
              context.push(
                // query parameters : Uri() 사용
                Uri(
                  path: '/query_param',
                  // 값은 스트링
                  queryParameters: {
                    'name': 'hello',
                    'age': '32',
                  },
                ).toString(),
              );
            },
            child: Text('Query Params'),
          ),
        ],
      ),
    );
  }
}
