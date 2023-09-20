import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whoever/app/core/router/app_router.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/user_service.dart';

class PinController extends GetxController {
  // ---------------- Field ------------------------
  late final TextEditingController pinController;
  final focusNode = FocusNode();
  RxInt pinCode = 0.obs;

  final user = Get.find<UserService>();

// ------------------ Method -----------------------------
  @override
  void onInit() {
    super.onInit();
    pinController = TextEditingController();
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();
    super.onClose();
  }

  pinValidator(String value) {
    if (value.isEmpty || value.length != 4 || value != '1234') {
      pinController.text = '';
      return '비밀번호를 확인해 주세요';
    } else {
      user.setLogin();
      Get.offAndToNamed(Routes.HOME);
    }
  }
}
