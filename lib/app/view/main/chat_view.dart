import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:whoever/app/controller/asset_controller.dart';
import 'package:whoever/app/core/ui/layout/app_layout.dart';
import 'package:whoever/app/core/ui/theme/custom_theme.dart';
import 'package:whoever/app/core/util/utils.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final assetController = Get.put(AssetController());
    final data = Future.delayed(Duration(seconds: 5), () {
      return Random().nextInt(10);
    });
    return AppLayout(
      body: FutureBuilder(
        future: data,
        builder: (_, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return assetController.showLoading(
              onLoading: !snapshot.hasData,
            );
          }
          return Container(
            child: Center(
              child: Text(
                snapshot.data.toString(),
                style: customHeader,
              ),
            ),
          );
        },
      ),
      needBottomNavigationBar: true,
    );
  }
}
