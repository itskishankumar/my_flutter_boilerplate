import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

class ModalController extends GetxController {
  final _isModalOpen = false.obs;

  bool get isModalOpen => _isModalOpen.value;

  set isModalOpen(bool value) => _isModalOpen.value = value;

  Future<void> openBottomSheet(Widget bottomSheet) async {
    _isModalOpen.value = true;
    await Get.bottomSheet(bottomSheet, isScrollControlled: true);
    _isModalOpen.value = false;
  }

  Future<void> openSideSheet(Widget bottomSheet, BuildContext context) async {
    _isModalOpen.value = true;
    await SideSheet.left(width: MediaQuery.of(context).size.width * 1, body: bottomSheet, context: context);
    _isModalOpen.value = false;
  }

  Future<void> showDialog(Widget dialog) async {
    _isModalOpen.value = true;
    await Get.dialog(dialog, barrierDismissible: false);
    _isModalOpen.value = false;
  }

  void closeModal() {
    Get.back();
    _isModalOpen.value = false;
  }
}
