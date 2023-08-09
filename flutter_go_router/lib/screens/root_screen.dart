import 'package:flutter/material.dart';
import 'package:flutter_go_router/layout/default_layout.dart';
import 'package:go_router/go_router.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: GoRouterState.of(context).name.toString(),
      body: ListView(
        children: [
          btn(
            // onPressed: () => context.go('/basic'),
            onPressed: () => context.goNamed('basic'),
            title: 'Basic',
          ),
          btn(
            onPressed: () => context.goNamed('Named'),
            title: 'Named',
          ),
          btn(
            onPressed: () => context.goNamed('Push'),
            title: 'Go Push',
          ),
          btn(
            onPressed: () => context.goNamed('Pop'),
            title: 'Go Push',
          ),
          btn(
            onPressed: () => context.go('/path_param/123'),
            title: 'Go PathParam',
          ),
          btn(
            onPressed: () => context.go('/query_param'),
            title: 'Go QueryParam',
          ),
          btn(
            onPressed: () => context.go('/nested/a'),
            title: 'Go Shell Router',
          ),
          btn(
            onPressed: () => context.go('/login'),
            title: 'Go Login Screen',
          ),
          btn(
            onPressed: () => context.go('/login2'),
            title: 'Go Login Screen',
          ),
          btn(
            onPressed: () => context.go('/transition'),
            title: 'Go Transition',
          ),
          btn(
            onPressed: () => context.go('/error'),
            title: 'Go Error Screen',
          ),
        ],
      ),
    );
  }

  Widget btn({
    required onPressed,
    required title,
  }) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amberAccent,
        ),
        child: Text(title),
      ),
    );
  }
}
