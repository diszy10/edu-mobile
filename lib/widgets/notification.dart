import 'package:flutter/material.dart';

class EduNotification extends StatefulWidget {
  const EduNotification({Key key}) : super(key: key);

  @override
  _EduNotificationsState createState() => new _EduNotification();
}

class _EduNotificationsState extends State<EduNotification> {
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
}
