import 'package:bluetooth_tutorial/common_ui/resources/strings.dart';
import 'package:bluetooth_tutorial/features/bluetooth_off/bluetooth_off.dart';
import 'package:bluetooth_tutorial/features/connected_devices/connected_devices.dart';
import 'package:bluetooth_tutorial/features/device/device.dart';
import 'package:bluetooth_tutorial/features/find_devices/find_devices.dart';
import 'package:bluetooth_tutorial/features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/splash',
      translations: Strings(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('et', 'ET'),
      getPages: [
        GetPage<SplashScreen>(
          name: '/splash',
          page: SplashScreen.new,
          binding: SplashBinding(),
        ),
        GetPage<FindDevicesScreen>(
            name: '/find-devices',
            page: FindDevicesScreen.new,
            binding: FindDevicesBinding(),
            transition: Transition.rightToLeftWithFade),
        GetPage<BluetoothOffScreen>(
          name: '/bluetooth-off',
          page: BluetoothOffScreen.new,
          transition: Transition.leftToRightWithFade,
        ),
        GetPage<ConnectedDevicesScreen>(
          name: '/connected-devices',
          page: ConnectedDevicesScreen.new,
          binding: ConnectedDevicesBinding(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage<DeviceScreen>(
          name: '/device',
          page: DeviceScreen.new,
          binding: DeviceBinding(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
