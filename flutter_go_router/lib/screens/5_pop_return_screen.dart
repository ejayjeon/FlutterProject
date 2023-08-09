import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              // 값 반환은? pop의 파라미터에 한 개든, 배열이든 클래스든 다 반환가능
              // context.pop('안뇽안뇽');
              context.pop([1, 2, 3, 4, 5]);
            },
            child: Text('Pop Return Screen'),
          ),
        ],
      ),
    );
  }
}
