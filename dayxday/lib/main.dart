import 'package:dayxday/components/calendar.dart';
import 'package:dayxday/screen/home_screen.dart';
import 'package:dayxday/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'modu',
        primaryColor: pinkPerfume,
        backgroundColor: appleGreen,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/calendar': (context) => Calendar(),
      },
    ),
  );
}
