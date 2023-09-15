import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;

  Future<UserService> init() async {
    return this;
  }

  void login() {
    _isLogin.value = true;
  }

  void logout() {
    _isLogin.value = false;
  }
}
