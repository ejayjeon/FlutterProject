import 'package:flutter/material.dart';
import 'package:worabel/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
    },
  ));
}
