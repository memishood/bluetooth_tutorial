import 'package:bluetooth_tutorial/common_ui/core/base_view.dart';
import 'package:bluetooth_tutorial/common_ui/extensions/widget_extensions.dart';
import 'package:bluetooth_tutorial/features/splash/splash.dart';
import 'package:flutter/material.dart';

class SplashScreen extends BaseView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, SplashController controller) {
    return Image.asset(
      'assets/images/png/bluetooth.png',
      width: 100,
      height: 100,
    ).toCenter();
  }
}
