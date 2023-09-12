import 'dart:math';

import 'package:get/get.dart';
import 'package:whoever/app/common/util/util.dart';
import 'package:whoever/app/view/home/home_view.dart';

class HomeController extends GetxController with StateMixin<HomeView> {
  @override
  void onInit() {
    super.onInit();
    getRdNum();
  }

  final RxString _text = 'success'.obs;
  RxString get text => _text;

  // ChangeState
  void getRdNum() async {
    change(null, status: RxStatus.loading());

    await Future.delayed(const Duration(seconds: 1));

    final rdNum = Random();
    switch (rdNum.nextInt(3)) {
      case 0:
        change(null, status: RxStatus.empty());
        break;
      case 1:
        change(null, status: RxStatus.error('Error'));
        break;
      case 2:
        change(null, status: RxStatus.success());
        break;
      default:
        break;
    }
  }
}
