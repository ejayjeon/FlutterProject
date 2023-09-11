import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whoever/app/auth/controller/auth_controller.dart';
import 'package:whoever/app/auth/service/auth_service.dart';
import 'package:whoever/app/common/controller/app_controller.dart';
import 'package:whoever/app/common/service/storage_manager.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/view_model/home/home_controller.dart';
import 'package:whoever/app/view_model/intro/intro_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    // await Get.putAsync<SharedPreferences>(() => PrefererenceService().init());
    // Get.put(PrefererenceService());
    Get.put(AuthService());
    Get.put(AppController());
    Get.put(HomeController());
    Get.put(IntroController());
    Get.put(AuthController());
    return;
  }
}
