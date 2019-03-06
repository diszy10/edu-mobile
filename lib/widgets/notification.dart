import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class EduNotification extends StatefulWidget {
  const EduNotification({Key key}) : super(key: key);

  @override
  _EduNotificationsState createState() => _EduNotification();
}

class _EduNotificationsState extends State<EduNotification> {
  @override
  initState() {
    super.initState();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        selectNotification: onSelectNotification);
  }

//Widget UI disini

// Buat cek informasi fungsi notifikasi
//   Future onSelectNotification(String payload) async {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return new AlertDialog(
//           title: Text("PayLoad"),
//           content: Text("Payload : $payload"),
//         );
//       },
//     );
//   }
// }

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
