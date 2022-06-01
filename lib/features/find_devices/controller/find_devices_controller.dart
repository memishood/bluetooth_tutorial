import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class FindDevicesController extends GetxController {
  FindDevicesController(this.flutterBlue);
  final FlutterBlue flutterBlue;
  final scanResults = RxList<ScanResult>();
  final scanning = RxBool(false);

  @override
  void onInit() {
    scanResults.bindStream(flutterBlue.scanResults);
    scanning.bindStream(flutterBlue.isScanning);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    startScan();
  }

  Future<void> startScan({Duration? duration}) async {
    await flutterBlue.startScan(
      scanMode: ScanMode.balanced,
      timeout: duration ?? const Duration(seconds: 4),
    );
  }

  Future<void> stopScan() async {
    await flutterBlue.stopScan();
  }

  Future<void> connectDevice(ScanResult result) async {
    await result.device.connect();
  }
}
