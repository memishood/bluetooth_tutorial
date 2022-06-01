import 'package:bluetooth_tutorial/common_ui/resources/strings.dart';
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
      ],
    );
  }
}
