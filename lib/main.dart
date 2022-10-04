import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'constants/app_screens.dart';
import 'constants/theme.dart';
import 'controllers/navigation_controller.dart';
import 'services/initialization_service.dart';

void main() async {
  await InitializationService.initializeLogic();
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NavigationController navigationController = Get.find();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App name',
      theme: appTheme,
      initialRoute: AppScreen.splash,
      routingCallback: (routing) => navigationController.setCurrentScreen(routing!),
      getPages: appScreens,
      onInit: () => InitializationService.initializeUi(),
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(builder: (context) => child!),
          ],
        );
      },
    );
  }
}
