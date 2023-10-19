import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:whoever/app/core/util/utils.dart';

class AssetController extends GetxController with GetTickerProviderStateMixin {
  // -------------------- Field ----------------------------
  AnimationController? loadingController;
  LottieBuilder? loading;
  // Future<LottieComposition>? loading;

// ---------------------------- method ------------------------------
  @override
  void onInit() async {
    super.onInit();
    loadingController = AnimationController(vsync: this);
    loading = LottieBuilder.asset(
      'assets/image/lotti_letter_loading.json',
      controller: loadingController,
      onLoaded: (composition) {
        loadingController!
          ..duration = composition.duration
          ..repeat();
      },
      height: 200,
      width: 200,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }

  showLoading({bool onLoading = true}) {
    return Center(
      child: onLoading ? loading : null,
    );
  }
}
