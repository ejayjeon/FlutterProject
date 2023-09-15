import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/pref_service.dart';
import 'package:whoever/app/service/user_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(AppController());
    await Get.putAsync(() => PrefService().init());
    await Get.putAsync(() => UserService().init());
  }
}
