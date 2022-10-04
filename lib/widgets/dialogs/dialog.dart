import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme.dart';
import '../../controllers/modal_controller.dart';

class CustomDatePickerDialog extends StatelessWidget {
  final ModalController modalController = Get.find();

  CustomDatePickerDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
      child: Container(
        padding: EdgeInsets.all(Spacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
