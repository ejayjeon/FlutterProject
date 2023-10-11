import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
  // --------------------- Field ------------------------------

  late final QuillController editController;
  late final ScrollController editScrollController;

  // -------------------------- Method ---------------------------

  @override
  void onInit() {
    super.onInit();
    editController = QuillController.basic();
    editScrollController = ScrollController();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<String?> onImagePicker(File file) async {}
}
