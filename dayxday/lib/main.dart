// ignore_for_file: use_key_in_widget_constructors

import 'package:dayxday/pages/home.dart';
import 'package:dayxday/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          bottomSheetTheme: BottomSheetThemeData(backgroundColor: veryPeri)),
      title: 'Day X Day',
      home: Home(),
    );
  }
}
