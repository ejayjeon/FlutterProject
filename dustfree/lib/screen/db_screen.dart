import 'package:flutter/material.dart';

class DbScreen extends StatefulWidget {
  DbScreen({Key? key}) : super(key: key);

  @override
  State<DbScreen> createState() => _DbScreenState();
}

class _DbScreenState extends State<DbScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text('텍스트')],
      ),
    );
  }
}
