import 'package:flutter/material.dart';

Future _notification() async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      '1', 'Edookasi', 'Edookasi for better education',
      playSound: false, importance: Importance.Max, priority: Priority.High);
  var iOSPlatformChannelSpecifics =
      new IOSNotificationDetails(presentSound: false);
  var platformChannelSpecifics = new NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0,
    'Harida, S.Pd.',
    'Tolong jangan nyuri risol dikantin lagi ya kamu !',
    platformChannelSpecifics,
    payload: 'No_Sound',
  );
}