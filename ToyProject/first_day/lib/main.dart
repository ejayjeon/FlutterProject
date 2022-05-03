import 'package:flutter/material.dart';
import 'package:first_day/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Elice',
        textTheme: TextTheme(
          headline1: TextStyle(
             color: Colors.white,
                fontFamily: 'BadScript',
                fontWeight: FontWeight.bold,
                fontSize: 60.0,
          ),
          headline2: TextStyle(
            color: Colors.white,
                fontFamily: 'BadScript',
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
          ),
          bodyText1: TextStyle(
             color: Colors.white,
                
                fontSize: 30.0,
          ),
          bodyText2: TextStyle(
              color: Colors.white,
                  
                  fontSize: 20.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
     home: HomeScreen(),
    );
  }
}
