import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/ui_constants.dart';
import '../constants/api_routes.dart';
import '../controllers/user_controller.dart';
import '../services/url_launcher_service.dart';
import '../widgets/buttons/custom_text_button.dart';

class AppUpdateScreen extends StatelessWidget {
  AppUpdateScreen({Key? key}) : super(key: key);

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: Spacing.screenPadding,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("An update is available!", style: Get.theme.textTheme.headline1, textAlign: TextAlign.center),
            const SizedBox(height: Spacing.marginMedium),
            SizedBox(
              width: 300,
              child: userController.forceUpdateMessage != "" && userController.forceUpdateMessage.isNotEmpty
                  ? Text(
                      userController.forceUpdateMessage,
                      style: Get.theme.textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    )
                  : userController.forceAppUpdate
                      ? Text(
                          "Please update the app to continue using it.",
                          style: Get.theme.textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        )
                      : Text(
                          "Please update the app to get the latest experience.",
                          style: Get.theme.textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
            ),
            const SizedBox(height: Spacing.sectionSpaceVerticalMedium),
            Platform.isAndroid
                ? CustomTextButton(text: "Take me to Playstore", onTap: goToStore)
                : CustomTextButton(text: "Take me to Appstore", onTap: goToStore),
            const SizedBox(height: Spacing.marginMedium),
            if (!userController.forceAppUpdate)
              InkWell(
                onTap: () => Get.back(),
                child: Text(
                  "Later",
                  style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.primaryColor),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void goToStore() {
    if (Platform.isAndroid) {
      openUrl(url: ApiRoute.storeRoute[StoreRoute.playstore]!, launchMode: LaunchMode.externalApplication);
    }
    if (Platform.isIOS) {
      openUrl(url: ApiRoute.storeRoute[StoreRoute.appstore]!, launchMode: LaunchMode.externalApplication);
    }
  }
}
