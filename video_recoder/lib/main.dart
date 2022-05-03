import 'package:flutter/material.dart';
import 'package:video_recoder/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    ),
  );
}
