import 'package:bluetooth_tutorial/common_ui/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w700,
                      fontSize: 21,
                    ),
                  ).toCenter(),
                ),
                IconButton(
                  onPressed: Get.back,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const Divider().marginOnly(top: 5),
            content,
          ],
        ).paddingAll(10),
      ),
    );
  }
}
