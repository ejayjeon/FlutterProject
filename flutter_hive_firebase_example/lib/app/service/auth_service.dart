import 'package:get/get.dart';

/**
 * User Check Service
 */
class AuthService extends GetxService {
  static AuthService get to => Get.find();

  // 임시 데이터
  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;

  void login() {
    _isLogin.value = true;
  }

  void logout() {
    _isLogin.value = false;
  }
}
