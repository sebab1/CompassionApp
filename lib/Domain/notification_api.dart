import 'dart:ui';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();



static Future<void> initialize() async {
    // Initialization  setting for android
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher');

    _notifications.resolvePlatformSpecificImplementation<
    AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

    final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid);

    await _notifications.initialize(
      initializationSettings,
      // to handle event when we receive notification 
      onDidReceiveNotificationResponse: (details) => null
    );
  }

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name', channelDescription: 'channel description', importance: Importance.max, priority: Priority.high, ticker: 'ticker', color: Color(0xffd15a56)),
      iOS: DarwinNotificationDetails(),
    );
  }
  

  static Future showNotification({
  int id = 0,
  String? title,
  String? body,
  String? payload,
  }) async => await _notifications.show(id, title, body, await _notificationDetails(), payload: payload);
}