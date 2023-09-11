import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/auth/controller/auth_controller.dart';
import 'package:whoever/app/view/user/login_view.dart';

class UserView extends GetView {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          LoginView(),
        ],
      ),
    );
  }
}
