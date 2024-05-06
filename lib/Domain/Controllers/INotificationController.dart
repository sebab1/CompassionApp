abstract class INotificationController {

    Future<void> initialize();
    Future recurringNotification({
        int id = 0,
    String? title,
    String? body,
    String? payload,
    required int hour,
    required int minutes
  });
    Future cancelAllNotification();
}