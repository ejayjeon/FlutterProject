// ignore_for_file: unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dayxday/style.dart';

class SimplePage extends StatelessWidget {
  const SimplePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('심플 페이지')
      )
    );
  }
}