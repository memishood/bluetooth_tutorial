import 'package:bluetooth_tutorial/features/device/device.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class DeviceBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(FlutterBlue.instance)
      ..put(DeviceController(Get.find()));
  }
}
