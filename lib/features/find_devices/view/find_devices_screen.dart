import 'package:bluetooth_tutorial/common_ui/core/base_view.dart';
import 'package:bluetooth_tutorial/common_ui/extensions/dialog_extensions.dart';
import 'package:bluetooth_tutorial/common_ui/extensions/widget_extensions.dart';
import 'package:bluetooth_tutorial/common_ui/views/empty_view.dart';
import 'package:bluetooth_tutorial/features/find_devices/find_devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class FindDevicesScreen extends BaseView<FindDevicesController> {
  const FindDevicesScreen({Key? key}) : super(key: key);

  @override
  AppBar? get appBar {
    return AppBar(
      title: Text('find_devices'.tr),
      actions: [
        TextButton.icon(
          onPressed: () => Get.toNamed('/connected-devices'),
          icon: const Icon(Icons.device_hub),
          label: Text('connected_devices'.tr),
        ),
      ],
    );
  }

  @override
  Widget? get fab {
    return Obx(() {
      return FloatingActionButton(
        onPressed: controller.scanning.value
            ? controller.stopScan
            : controller.startScan,
        child: controller.scanning.value
            ? const Icon(Icons.stop)
            : const Icon(Icons.search),
      );
    });
  }

  @override
  Widget builder(BuildContext context, FindDevicesController controller) {
    return Obx(() {
      if (controller.scanning.value) {
        return const CircularProgressIndicator().toCenter();
      }
      if (controller.scanResults.isEmpty) {
        return EmptyView(
          message: 'empty_scan_result'.tr,
        ).toCenter();
      }
      return ListView.separated(
        itemBuilder: (_, index) {
          final scanResult = controller.scanResults[index];
          return ListTile(
            leading: const Icon(
              Icons.bluetooth,
              size: 36,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            title: Text(scanResult.device.name),
            subtitle: Text(scanResult.device.id.id),
            onTap: () => _connect(scanResult),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: controller.scanResults.length,
      );
    });
  }

  Future<void> _connect(ScanResult result) async {
    if (result.advertisementData.connectable) {
      await controller.connectDevice(result);
      Get.toNamed('/device', arguments: result.device);
    } else {
      showErrorDialog('device_is_not_connectable'.tr);
    }
  }
}
