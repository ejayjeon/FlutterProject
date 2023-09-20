import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/pref_service.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

// ------------------- Field -------------------------------
  final loginFormKey = GlobalKey<FormState>(); // Login Validation을 위한 키

  // Login Check
  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;

  // User Email
  final _userEmail = ''.obs;
  String get userName => _userEmail.value;

  // User Password
  final _userPassword = ''.obs;
  String get userPassword => _userPassword.value;

  Future<UserService> init() async {
    Log('User service init...');
    return this;
  }

  // ----------------------- Setter -------------------------------

  void setLogin() async {
    _isLogin.value = true;
    PrefManager.setData('isLogin', _isLogin.value);
  }

  void setLogout() async {
    _isLogin.value = false;
    PrefManager.setData('isLogin', _isLogin.value);
  }

  void setUserEmail(String value) {
    if (value.isNotEmpty || value.isEmail) {
      _userEmail.value = value;
    }
  }

  void setUserPassWord(String value) {
    if (value.isNotEmpty || value.length >= 4) {
      _userPassword.value = value;
    }
  }
}
