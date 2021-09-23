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

Future<void> showrepeat() async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
    id: createUniqueId(),
    channelKey: 'basic_channel',
    title: 'Simple Notification',
    body: 'Simple body',
    color: Colors.red[600],
    bigPicture: 'asset://assets/pill.png',
    notificationLayout: NotificationLayout.BigPicture,
  ));
}
