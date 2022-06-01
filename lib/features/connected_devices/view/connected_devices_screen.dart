import 'package:bluetooth_tutorial/common_ui/core/base_view.dart';
import 'package:bluetooth_tutorial/common_ui/extensions/dialog_extensions.dart';
import 'package:bluetooth_tutorial/common_ui/extensions/widget_extensions.dart';
import 'package:bluetooth_tutorial/common_ui/views/empty_view.dart';
import 'package:bluetooth_tutorial/features/connected_devices/connected_devices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

class ConnectedDevicesScreen extends BaseView<ConnectedDevicesController> {
  const ConnectedDevicesScreen({Key? key}) : super(key: key);

  @override
  AppBar? get appBar {
    return AppBar(
      title: Text('connected_devices'.tr),
    );
  }

  @override
  Widget builder(BuildContext context, ConnectedDevicesController controller) {
    return Obx(() {
      if (controller.connectedDevices.isEmpty) {
        return EmptyView(
          message: 'empty_connected_devices'.tr,
        ).toCenter();
      }
      return ListView.separated(
        itemBuilder: (_, index) {
          final connectedDevice = controller.connectedDevices[index];
          return ListTile(
            leading: const Icon(
              Icons.device_hub,
              size: 36,
            ),
            trailing: StreamBuilder<BluetoothDeviceState>(
              initialData: BluetoothDeviceState.disconnected,
              stream: connectedDevice.state,
              builder: (_, snapshot) {
                return IconButton(
                  onPressed: () => _navigateToDialog(
                    snapshot.data,
                    connectedDevice,
                  ),
                  icon: const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
            title: Text(connectedDevice.name),
            subtitle: Text(connectedDevice.id.id),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: controller.connectedDevices.length,
      );
    });
  }

  void _navigateToDialog(BluetoothDeviceState? state, BluetoothDevice device) {
    if (state == BluetoothDeviceState.connected) {
      Get.toNamed('/device', arguments: device);
    } else {
      showErrorDialog('device_is_not_connectable'.tr);
    }
  }
}
