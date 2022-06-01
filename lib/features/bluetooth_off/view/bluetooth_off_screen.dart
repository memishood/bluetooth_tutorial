import 'package:bluetooth_tutorial/common_ui/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/png/bluetooth.png',
              width: 96,
              height: 96,
            ),
            Column(
              children: [
                Text(
                  'connect'.tr,
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                ),
                Text(
                  'bluetooth_is_off'.tr,
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.center,
                ).marginAll(15),
              ],
            ),
          ],
        ).toCenter(),
      ),
    );
  }
}
