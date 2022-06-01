import 'package:bluetooth_tutorial/common_ui/core/base_dialog.dart';
import 'package:bluetooth_tutorial/common_ui/core/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension DialogX on BaseView {
  void showErrorDialog(String message) {
    Get.dialog(
      BaseDialog(
        title: 'error'.tr,
        content: Column(
          children: [
            Image.asset(
              'assets/images/png/warning.png',
              width: 72,
              height: 72,
            ),
            Text(
              message,
              style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
              textAlign: TextAlign.center,
            ).marginSymmetric(vertical: 10),
          ],
        ),
      ),
    );
  }
}
