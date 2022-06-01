import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class ConnectedDevicesController extends GetxController {
  ConnectedDevicesController(this.flutterBlue);
  final FlutterBlue flutterBlue;
  final connectedDevices = RxList<BluetoothDevice>();

  @override
  void onInit() {
    connectedDevices.bindStream(connectedDevicesStream);
    super.onInit();
  }

  Stream<List<BluetoothDevice>> get connectedDevicesStream {
    return Stream.periodic(const Duration(seconds: 1)).asyncMap((_) {
      return flutterBlue.connectedDevices;
    });
  }
}
