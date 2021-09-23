import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:medmind/services/utility.dart';

Future<void> show({String title = '', String body = ''}) async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: createUniqueId(),
    channelKey: 'basic_channel',
    title: '${title}',
    body: '${body}',
    color: Colors.red[600],
    bigPicture: 'asset://assets/pill.png',
    notificationLayout: NotificationLayout.BigPicture,
  ));
}

Future<void> showRepeat({int hour = 0, min = 0, sec = 0}) async {
  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();
  String utcTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: 'scheduled',
          title: 'Notification at every single minute',
          body:
              'This notification was schedule to repeat at every single minute.',
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'asset://assets/images/melted-clock.png'),
      schedule: NotificationCalendar(
          hour: hour, minute: min, second: sec, repeats: true));
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
