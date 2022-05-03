import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: bgColorWhite,
    primaryColor: veryPeri,
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: bgColorDark,
    primaryColor: veryPeri,
  );
}

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'New Task',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.only(top: 25, bottom: 25, left: 20),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

const veryPeri = Color.fromRGBO(102, 103, 171, 1);
const bgColorDark = Color(0xFF2E2E2E);
const bgColorWhite = Color(0xFFFFFBFB);
