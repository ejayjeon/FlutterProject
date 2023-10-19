import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whoever/app/controller/auth_controller.dart';
import 'package:whoever/app/service/auth_service.dart';
import 'package:whoever/app/controller/app_controller.dart';
import 'package:whoever/app/service/firebase_service.dart';
import 'package:whoever/app/service/firestore_service.dart';
import 'package:whoever/app/service/hive_service.dart';
import 'package:whoever/app/service/storage_manager.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/controller/home_controller.dart';
import 'package:whoever/app/controller/intro_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    Get.put(AuthService());
    Get.put(AppController());
    Get.put(HomeController());
    Get.put(IntroController());
    Get.put(AuthController());
    await Get.putAsync(() => FirebaseService().init());
    await Get.putAsync(() => HiveService().init());
    await Get.putAsync(() => FireStoreService().init());

    return;
  }
}
