import 'package:bluetooth_tutorial/features/find_devices/find_devices.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/instance_manager.dart';

class FindDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(FlutterBlue.instance)
      ..put(FindDevicesController(Get.find()));
  }
}
