import 'package:bluetooth_tutorial/features/splash/controller/splash_controller.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(FlutterBlue.instance)
      ..put(SplashController(Get.find()));
  }
}
