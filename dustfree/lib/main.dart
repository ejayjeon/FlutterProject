import 'package:dustfree/screen/home_screen.dart';
import 'package:dustfree/screen/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SurroundAir',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/main': (context) => const MainScreen(),
        // '/calendar': (context) => CalendarScreen(),
      },
    ),
  );
}
