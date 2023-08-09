import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class PrivateScreen extends StatelessWidget {
  const PrivateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).location.toString(),
      body: Center(
        child: Text('Private'),
      ),
    );
  }
}
