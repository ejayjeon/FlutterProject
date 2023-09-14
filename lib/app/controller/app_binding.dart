import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(AppController());
  }
}
