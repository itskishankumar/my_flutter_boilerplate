import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/theme.dart';

void showToast({
  required String title,
  required String message,
  SnackBarVariant snackBarVariant = SnackBarVariant.error,
}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 5),
    isDismissible: true,
    backgroundColor: _snackBarBackgroundColor(snackBarVariant),
    margin: const EdgeInsets.only(left: Spacing.regular, right: Spacing.regular, bottom: Spacing.medium),
    snackPosition: SnackPosition.BOTTOM,
    titleText: Text(title, style: Get.theme.textTheme.headline4),
    messageText: Text(message, style: Get.theme.textTheme.bodyText1),
  );
}

Color _snackBarBackgroundColor(SnackBarVariant snackBarVariant) {
  switch (snackBarVariant) {
    case SnackBarVariant.error:
      return Get.theme.errorColor;
    case SnackBarVariant.info:
      return Get.theme.colorScheme.tertiary;
    case SnackBarVariant.success:
      return Get.theme.colorScheme.tertiary;
    default:
      return Get.theme.colorScheme.tertiary;
  }
}
