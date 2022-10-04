import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilterplate/controllers/navigation_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../controllers/modal_controller.dart';
import '../controllers/network_controller.dart';
import '../controllers/user_controller.dart';
import 'notification_service.dart';

class InitializationService {
  static Future<void> initializeLogic() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null && notification.title != null && notification.body != null) {
        NotificationService().showNotification(notification.title!, notification.body!);
      }
    });

    Get.put(ModalController(), permanent: true);
    Get.put(NavigationController(), permanent: true);
    Get.put(NetworkController());
    Get.put(AuthController());
    Get.put(UserController());
  }

  static Future<void> initializeUi() async {
    final AuthController authController = Get.find();
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final UserController userController = Get.find();

    void checkIfUserValid() {
      if (userController.isLoggedIn) {
        if (userController.user?.firstName == null || userController.user?.firstName == '') {}
      } else {}
    }

    void dynamicLinkHandler(PendingDynamicLinkData? dynamicLink) {
      String link = dynamicLink?.link.toString() ?? "";
      if (firebaseAuth.isSignInWithEmailLink(link)) {
        authController.finishEmailSignup(link);
      }
    }

    void checkForAppUpdate() async {
      try {
        final remoteConfig = FirebaseRemoteConfig.instance;
        await remoteConfig.ensureInitialized();
        await remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(hours: 24),
        ));
        await remoteConfig.fetchAndActivate();
        if (Platform.isAndroid) {
          RemoteConfigValue androidVersion = remoteConfig.getValue(FirebaseRemoteConfigKeys.androidVersion);
          if (await checkIfVersionGreater(jsonDecode(androidVersion.asString())['v'])) {
            userController.forceUpdateMessage = jsonDecode(androidVersion.asString())['message'] ?? '';
            if (jsonDecode(androidVersion.asString())['force'] == true) {
              userController.forceAppUpdate = true;
              Get.offAllNamed(AppRoute.update);
            } else {
              userController.forceAppUpdate = false;
              Get.toNamed(AppRoute.update);
            }
          }
        }
        if (Platform.isIOS) {
          RemoteConfigValue iOSVersion = remoteConfig.getValue(FirebaseRemoteConfigKeys.iosVersion);
          if (await checkIfVersionGreater(jsonDecode(iOSVersion.asString())['v'])) {
            userController.forceUpdateMessage = jsonDecode(iOSVersion.asString())['message'];
            if (jsonDecode(iOSVersion.asString())['force'] == true) {
              userController.forceAppUpdate = true;
              Get.offAllNamed(AppRoute.update);
            } else {
              userController.forceAppUpdate = false;
              Get.toNamed(AppRoute.update);
            }
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }

    void userInit() async {
      try {
        PendingDynamicLinkData? dynamicLinkData = await FirebaseDynamicLinks.instance.getInitialLink();
        if (dynamicLinkData != null) {
          dynamicLinkHandler(dynamicLinkData);
        } else {
          checkIfUserValid();
        }
        FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) => dynamicLinkHandler(dynamicLinkData));
      } catch (_) {
        checkIfUserValid();
      }
    }

    checkForAppUpdate();

    if (userController.initialised.value) {
      userInit();
    }
    ever(userController.initialised, (bool initialised) async {
      if (initialised) {
        userInit();
      }
    });
  }
}
