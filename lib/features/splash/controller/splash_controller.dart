import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController(this.flutterBlue);
  final FlutterBlue flutterBlue;
  final bluetoothState = Rx<BluetoothState>(BluetoothState.unknown);

  @override
  Future<void> onInit() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    ever(bluetoothState, (BluetoothState state) {
      if (state == BluetoothState.on) {
        Get.offAllNamed('/find-devices');
      } else {
        Get.offAllNamed('/bluetooth-off');
      }
    });
    bluetoothState.bindStream(flutterBlue.state);
    super.onInit();
  }
}
