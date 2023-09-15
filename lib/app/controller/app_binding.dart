import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/service/pref_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(() => PrefService().init());
    Get.put(AppController());
  }
}
