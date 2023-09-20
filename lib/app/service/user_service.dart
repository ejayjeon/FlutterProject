import 'package:get/get.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/pref_service.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

// ------------------- Field -------------------------------
  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;

  RxString userName = ''.obs;
  RxString userEmail = ''.obs;

// --------------------------- Method --------------------------

  Future<UserService> init() async {
    userName.value = 'Ejayjeon';
    userEmail.value = 'ejjeon@kakao.com';

    Log('User service init...');
    return this;
  }

  void setLogin() async {
    _isLogin.value = true;
    PrefManager.setData('isLogin', _isLogin.value);
  }

  void setLogout() async {
    _isLogin.value = false;
    PrefManager.setData('isLogin', _isLogin.value);
  }
}
