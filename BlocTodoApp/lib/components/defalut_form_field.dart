import 'package:dayxday/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultFormField extends StatelessWidget {
  String? label;
  TextEditingController? controller;
  TextInputType? type;
  void Function(String)? onSubmit;
  void Function(String)? onChange;
  void Function()? onTap;
  bool isPassword = false;
  String? Function(String?)? validate;
  IconData? prefix;
  IconData? suffix;
  void Function()? suffixPressed;
  bool isClickable = true;
  bool isSuffix = false;

  DefaultFormField({
    Key? key,
    required this.controller,
    this.isClickable = true,
    this.isPassword = false,
    this.isSuffix = false,
    required this.label,
    this.onChange,
    this.onSubmit,
    this.onTap,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.type,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white, fontSize: 12),
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        validator: validate,
        decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: veryPeri, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lime, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            errorStyle: TextStyle(color: Colors.lime),
            filled: true,
            fillColor: Colors.white10,
            hintStyle: TextStyle(color: bgColorWhite),
            contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white10, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: veryPeri, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            labelText: label,
            labelStyle: TextStyle(color: bgColorWhite),
            prefixIcon: Icon(
              prefix,
              color: bgColorWhite,
            ),
            suffixIcon: isSuffix
                ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
                : null));
  }
}
