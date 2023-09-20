import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/pref_service.dart';
import 'package:whoever/app/service/user_service.dart';

class UserController extends GetxController {
  final service = Get.find<UserService>();

  @override
  void onInit() {
    super.onInit();
    Log('... user Controller init');
  }

  // -------------------- Validator --------------------------------

  String? emailValidator(String value) {
    if (value.isEmpty || !value.isEmail) {
      return '형식에 맞게 이메일을 작성해 주세요';
    }
    return null;
  }

  String? passWwordValidator(String value) {
    if (value.isEmpty || value.length < 4) {
      return '비밀번호는 4자리 이상으로 입력해 주세요';
    }
    return null;
  }

// --------------------------- Method --------------------------

  void formSubmit() {
    final isValid = service.loginFormKey.currentState!.validate();
    Get.focusScope!.unfocus();
    Log(isValid);

    if (isValid) {
      PrefManager.setData('loginValid', isValid);
      service.loginFormKey.currentState!.save();
      service.setLogin();

      Get.offAndToNamed(Routes.HOME);
    }
  }
}
