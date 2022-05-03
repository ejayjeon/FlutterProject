import 'package:flutter/material.dart';
import 'package:video_player/screen/home_screen.dart';
import 'package:video_player/screen/route_one.dart';
import 'package:video_player/screen/route_three.dart';
import 'package:video_player/screen/route_two.dart';

void main() {
  runApp(
    MaterialApp(
      // home : HomeScreen(),
      // routes를 썼을 때에는 무엇을 초기화면으로 쓸지 알 수 없기 때문에
      initialRoute: '/',
      routes: {
        '/': ((context) => HomeScreen()),
        '/one': (context) => RouteOne(),
        '/two': (context) => RouteTwo(),
        '/three': (context) => RouteThree(),
      },
    ),
  );
}
