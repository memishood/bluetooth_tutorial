import 'package:bluetooth_tutorial/common_ui/core/base_view.dart';
import 'package:bluetooth_tutorial/features/device/device.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceScreen extends BaseView<DeviceController> {
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  AppBar? get appBar {
    return AppBar(
      title: Text('device'.tr),
      actions: [],
    );
  }

  @override
  Widget builder(BuildContext context, DeviceController controller) {
    return Container();
  }
}
