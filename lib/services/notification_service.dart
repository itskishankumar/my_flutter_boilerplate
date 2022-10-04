import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final flutterNotification = FlutterLocalNotificationsPlugin();
  final androidDetails = const AndroidNotificationDetails(
    'Channel ID',
    'Notifications Channel',
    channelDescription: 'In app notifications',
    importance: Importance.max,
  );

  NotificationService() {
    const androidInitialize = AndroidInitializationSettings('notification_icon');
    const iOSInitialize = IOSInitializationSettings(
      requestSoundPermission: true,
      requestAlertPermission: true,
      requestBadgePermission: true,
    );
    const initializeSettings = InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    flutterNotification.initialize(initializeSettings);
  }

  Future showNotification(String title, String body) async {
    final generalNotificationDetails = NotificationDetails(android: androidDetails);
    await flutterNotification.show(0, title, body, generalNotificationDetails);
  }
}
