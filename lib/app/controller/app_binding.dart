import 'package:get/get.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/controller/asset_controller.dart';
import 'package:whoever/app/controller/edit_controller.dart';
import 'package:whoever/app/controller/pin_controller.dart';
import 'package:whoever/app/controller/user_controller.dart';
import 'package:whoever/app/core/util/utils.dart';
import 'package:whoever/app/service/pref_service.dart';
import 'package:whoever/app/service/user_service.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    await Get.putAsync(() => PrefService().init());
    await Get.putAsync(() => UserService().init());
    Get.put(AppController());
    Get.put(PinController());
    Get.put(UserController());
    Get.put(AssetController());
    Get.put(EditController());
    // Get.lazyPut(() => PinController());
  }
}
