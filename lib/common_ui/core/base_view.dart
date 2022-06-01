import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class BaseView<T extends GetxController> extends GetView<T> {
  const BaseView({Key? key}) : super(key: key);

  AppBar? get appBar => null;
  Widget builder(BuildContext context, T controller);
  Widget? get fab => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: builder(context, controller),
      ),
      floatingActionButton: fab,
    );
  }
}
