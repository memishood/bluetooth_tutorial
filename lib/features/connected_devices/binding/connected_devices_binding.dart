import 'package:bluetooth_tutorial/features/connected_devices/connected_devices.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class ConnectedDevicesBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(FlutterBlue.instance)
      ..put(ConnectedDevicesController(Get.find()));
  }
}
