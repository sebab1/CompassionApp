import 'dart:ui';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();



 Future<void> initialize() async {

  await BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15, // minimum interval in minutes
      stopOnTerminate: false,
      enableHeadless: true,
      startOnBoot: true,
    ),
    backgroundFetchCallback,
  );
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


void backgroundFetchCallback(String taskId) async {
  // Check last app usage time
  SharedPreferences prefs = await SharedPreferences.getInstance();
  DateTime lastUsageTime =
      DateTime.fromMillisecondsSinceEpoch(prefs.getInt('lastUsageTime') ?? 0);
  DateTime currentTime = DateTime.now();

  print('bg callback');

  // If it has been more than 12 hours since last usage, show notification
  //if (currentTime.difference(lastUsageTime).inMinutes >= 2) {
    showNotification(title: 'Compassion App', body: 'Hej! Måske trænger du til tid til afstresning med en dagbogsindtastning eller meditation.', payload: '123.ab');
  //}

  BackgroundFetch.finish(taskId);
}

}