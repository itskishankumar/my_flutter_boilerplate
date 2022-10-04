import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl({required String url, LaunchMode? launchMode}) async {
  try {
    await launchUrl(Uri.parse(url), mode: launchMode ?? LaunchMode.platformDefault);
  } catch (_) {}
}

void openPhoneDialer(String phoneNumber) async {
  await launchUrl(Uri.parse("tel:+99364921507"));
}

void openMailApp(BuildContext context) async {
  var result = await OpenMailApp.openMailApp();
  if (!result.didOpen && !result.canOpen) {
  } else if (!result.didOpen && result.canOpen) {
    showDialog(context: context, builder: (_) => MailAppPickerDialog(mailApps: result.options));
  }
}

Future<XFile?> pickImageFromGallery() {
  return ImagePicker().pickImage(source: ImageSource.gallery);
}

Future<XFile?> pickImageFromCamera() {
  return ImagePicker().pickImage(source: ImageSource.camera);
}

void goToStore() {
  if (Platform.isAndroid) {
    openUrl(url: ApiRoute.storeRoute[StoreRoute.playstore]!, launchMode: LaunchMode.externalApplication);
  }
  if (Platform.isIOS) {
    openUrl(url: ApiRoute.storeRoute[StoreRoute.appstore]!, launchMode: LaunchMode.externalApplication);
  }
}
