import 'package:flutter/material.dart';
import 'package:flutter_go_router/screens/10_login_screen.dart';
import 'package:flutter_go_router/screens/11_private_screen.dart';
import 'package:flutter_go_router/screens/12_transition_screen_1.dart';
import 'package:flutter_go_router/screens/13_transition_screen_2.dart';
import 'package:flutter_go_router/screens/14_error_screen.dart';
import 'package:flutter_go_router/screens/1_basic_screen.dart';
import 'package:flutter_go_router/screens/2_named_screen.dart';
import 'package:flutter_go_router/screens/3_push_screen.dart';
import 'package:flutter_go_router/screens/4_pop_base_screen.dart';
import 'package:flutter_go_router/screens/5_pop_return_screen.dart';
import 'package:flutter_go_router/screens/6_path_param_screen.dart';
import 'package:flutter_go_router/screens/7_query_param_screen.dart';
import 'package:flutter_go_router/screens/8_nested_screen.dart';
import 'package:flutter_go_router/screens/9_nested_child_screen.dart';
import 'package:flutter_go_router/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

// https://blog.naver.com/
// 도메인
// pass를 기준으로 라우터를 생성

// GoRouter는 한 번만 쓰는 것

// 로그인을 위한 변수 선언
bool authState = false; // 로그인이 됐는지 안 됐는지

final router = GoRouter(
  // state == GoRouterState
  // 모든 라우터에 전부 적용이 됨
  redirect: (context, state) {
    // return string (path) -> 해당 path로 이동한다
    // return null -> 원래 이동하려던 라우트로 이동한다.
    // /login/private 로 이동을 하려는데 막혀서 반환이 되어버림
    if (state.location == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
  routes: [
    // /
    GoRoute(
      path: '/', // location을 이용해 path를 가져올 수 있다
      name: 'Root',
      builder: (context, state) => const RootScreen(),
      routes: [
        // /basic
        GoRoute(
          path: 'basic',
          name: 'Basic',
          builder: (context, state) => const BasicScreen(),
        ),
        // /named
        GoRoute(
          path: 'named',
          name: 'Named',
          builder: (context, state) => const NamesScreen(),
        ),
        // /push
        GoRoute(
          path: 'push',
          name: 'Push',
          builder: (context, state) => const PushScreen(),
        ),
        // pop
        GoRoute(
          path: 'pop', // /pop
          name: 'Pop',
          builder: (context, state) => const PopBaseScreen(),
          routes: [
            GoRoute(
              path: 'return', // /pop/return
              name: 'Return',
              builder: (context, state) => const PopReturnScreen(),
            ),
          ],
        ),
        // path param/: -> 이 뒤에 값을 변수의 이름으로
        // path_param/:id -> id라는 변수를 받을 수 있음
        // builder에서 어떤 페이지를 반환하더라도 상관없음
        GoRoute(
          path: 'path_param/:id', // /pop/return
          name: 'PathParam',
          builder: (context, state) => const PathParamScreen(),
          routes: [
            //path_param/:id/:name
            // path_param 중첩해서 사용
            GoRoute(
              path: ':name', // /pop/return
              name: 'PathParam2',
              builder: (context, state) => const PathParamScreen(),
            ),
          ],
        ),
        // /query_param
        GoRoute(
          path: 'query_param',
          name: 'QueryParam',
          builder: (context, state) => const QueryParamScreen(),
        ),
        // 탭바 쉘라우트 : path가 없음
        ShellRoute(
          // 쉘라우트에 입력할 모든 위젯을 전부 감싸게 되는 위젯
          builder: (context, state, child) => NestedScreen(
            // child는 아래 감싼 Widget에서 온다
            // 만약 home, user, settings 라면 해당 페이지들을 넣으면 됨
            child: child,
          ),

          routes: [
            GoRoute(
              path: 'nested/a',
              // builder: (_, state) => NestedChildScreen(
              //   routeName: '/nested/a',
              // ),
              pageBuilder: (context, state) => CustomTransitionPage(
                child: NestedChildScreen(
                  routeName: '/nested/a',
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            ),
            // GoRoute(
            //   path: 'nested/b',
            //   builder: (_, state) => NestedChildScreen(
            //     routeName: '/nested/b',
            //   ),
            // ),
            GoRoute(
              path: 'nested/b',
              // builder: (_, state) => NestedChildScreen(
              //   routeName: '/nested/a',
              // ),
              pageBuilder: (context, state) => CustomTransitionPage(
                child: NestedChildScreen(
                  routeName: '/nested/b',
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            ),
            // GoRoute(
            //   path: 'nested/c',
            //   builder: (_, state) => NestedChildScreen(
            //     routeName: '/nested/c',
            //   ),
            // ),
            GoRoute(
              path: 'nested/c',
              // builder: (_, state) => NestedChildScreen(
              //   routeName: '/nested/a',
              // ),
              pageBuilder: (context, state) => CustomTransitionPage(
                child: NestedChildScreen(
                  routeName: '/nested/c',
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),

        // /login
        GoRoute(
          path: 'login',
          builder: (_, state) => LoginScreen(),
          routes: [
            // /login/private
            GoRoute(
              path: 'private',
              builder: (_, state) => PrivateScreen(),
            ),
          ],
        ),

        // 모든 리다이렉션 적용이 아니고 이 라우터 안에서만 적용하고 싶으면
        // 각각 라우트 내부에 redirect를 쓸 수 있다.
        GoRoute(
          path: 'login2',
          builder: (_, state) => LoginScreen(),
          routes: [
            // /login/private
            GoRoute(
              path: 'private',
              builder: (_, state) => PrivateScreen(),
              redirect: (context, state) {
                // 여기에다가 하면 state.location을 체크해줄 필요가 없다
                if (!authState) {
                  return '/login2';
                }
                return null;
              },
            ),
          ],
        ),
        GoRoute(
          path: 'transition',
          builder: (_, state) => TransitionScreen1(),
          routes: [
            // /login/private
            GoRoute(
              path: 'detail',
              // builder: (_, state) => TransitionScreen2(),
              // 트랜지션빌더
              pageBuilder: (context, state) => CustomTransitionPage(
                transitionDuration: Duration(seconds: 3),
                child: TransitionScreen2(),
                // 애니메이션 설명!!!
                transitionsBuilder:
                    // child: 위의 TransitionScreen2()
                    (context, animation, secondaryAnimation, child) {
                  // 투명도가 변하는
                  return FadeTransition(
                    opacity: animation, // 0 ~ 1
                    child: child,
                  );

                  // 다음 페이지에서 점점 커지는
                  // return ScaleTransition(
                  //   scale: animation,
                  //   child: child,
                  // );

                  // 돌아가는
                  // return RotationTransition(
                  //   turns: animation,
                  //   child: child,
                  // );
                },
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'error',
          name: 'Error',
          builder: (context, state) => ErrorScreen(
            error: state.error.toString(),
          ),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
);
