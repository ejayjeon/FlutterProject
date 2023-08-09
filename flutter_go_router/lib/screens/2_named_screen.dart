import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class NamesScreen extends StatelessWidget {
  const NamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: Center(
        child: Container(
          child: Text(
            GoRouterState.of(context).name.toString(),
          ),
        ),
      ),
    );
  }
}
