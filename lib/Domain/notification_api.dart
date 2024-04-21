import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {

    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // Initialization  setting for android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();

    _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin);

    await _notifications.initialize(initializationSettings,
        // to handle event when we receive notification
        onDidReceiveNotificationResponse: (details) => null);
  }

  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          channelDescription: 'channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          color: Color(0xffd15a56)),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      await _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  
  static Future recurringNotification({
        int id = 0,
    String? title,
    String? body,
    String? payload,
    required int hour,
    required int minutes
  }) async => await _notifications.zonedSchedule(id, title, body,_nextInstanceOfTimeOfDay(hour, minutes), await _notificationDetails(), uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, matchDateTimeComponents: DateTimeComponents.time);

  static tz.TZDateTime _nextInstanceOfTimeOfDay(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    print(now);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);
    print(scheduledDate);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    print(scheduledDate);
    return scheduledDate;
  }

  static Future pending() async{
             final List<PendingNotificationRequest> pendingNotificationRequests =
    await _notifications.pendingNotificationRequests();

    print(pendingNotificationRequests.first.body);
  }

}
