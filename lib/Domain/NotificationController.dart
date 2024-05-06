import 'package:compassion_app/Domain/Controllers/INotificationController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationController implements INotificationController {
  final _notifications = FlutterLocalNotificationsPlugin();

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

   Future _notificationDetails() async {
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

   Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      await _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  Future cancelAllNotification() async {
    return _notifications.cancelAll();
  }
  
  @override
  Future recurringNotification({
        int id = 0,
    String? title,
    String? body,
    String? payload,
    required int hour,
    required int minutes
  }) async => await _notifications.zonedSchedule(id, title, body,_nextInstanceOfTimeOfDay(hour, minutes), await _notificationDetails(), uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, matchDateTimeComponents: DateTimeComponents.time);

  tz.TZDateTime _nextInstanceOfTimeOfDay(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minutes);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }


}
