import 'package:get/get.dart';
import 'package:whoever/app/common/controller/app_controller.dart';
import 'package:whoever/app/home/controller/home_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(HomeController());
    return;
  }
}
