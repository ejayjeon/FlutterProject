import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/service/auth_service.dart';
import 'package:whoever/app/common/routes/app_router.dart';
import 'package:whoever/app/service/storage_manager.dart';
import 'package:whoever/app/common/util/util.dart';

/**
 * Login / User 
 */
class AuthController extends GetxController {
  // ------------ Field ---------------------------
  // final prefService = Get.find<PrefererenceService>();

  // TextFrom Validation을 위한 키
  final formKey = GlobalKey<FormState>();

  // UserEamil
  final _userEmail = ''.obs;
  String get userEmail => _userEmail.value;

  // UserPassword
  final _userPassword = ''.obs;
  String get userPassword => _userPassword.value;

  // ------------------ Method ---------------------
  String? emailValidator(String value) {
    if (value.isEmpty || !value.isEmail) {
      return '형식에 맞게 이메일을 작성해 주세요';
    }
    return null;
  }

  void setEmail(String value) {
    if (value.isNotEmpty || value.isEmail) {
      _userEmail.value = value;
    }
  }

  String? passWordValidator(String value) {
    if (value.isEmpty || value.length < 4) {
      return '비밀번호는 4자리 이상으로 입력해 주세요';
    }
    return null;
  }

  void setPassword(String value) {
    if (value.isNotEmpty || value.length >= 4) {
      _userPassword.value = value;
    }
  }

  void formSubmit() {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();
    // final pref = prefService.pref;

    if (isValid) {
      // pref.setBool('loginValid', isValid);
      StorageManager.setData('loginValid', isValid);
      formKey.currentState!.save();
      AuthService.to.login();

      Get.toNamed(Routes.HOME);
    }
  }
}
