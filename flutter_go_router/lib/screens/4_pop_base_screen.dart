import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopBaseScreen extends StatelessWidget {
  const PopBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: ListView(
        children: [
          // 데이터를 주고 받을려면 async
          ElevatedButton(
            onPressed: () async {
              final result = await context.push('/pop/return');
              print(result);
            },
            child: Text('Push Pop Return Screen'),
          ),
        ],
      ),
    );
  }
}
