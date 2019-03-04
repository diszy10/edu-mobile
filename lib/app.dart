import 'package:flutter/material.dart';

import './widgets/colors.dart';

import './screens/start_page.dart';
import './screens/main_page.dart';
import './screens/profile_page.dart';
import './screens/attendance_page.dart';
import './screens/homework_page.dart';

class EdukasiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _routes = <String, WidgetBuilder>{
      '/start': (BuildContext context) => new StartPage(),
      '/main': (BuildContext context) => new MainPage(),
      '/profile': (BuildContext context) => new ProfilePage(),
      '/attendance': (BuildContext context) => new AttendancePage(),
      '/homework': (BuildContext context) => new HomeworkPage(),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edukasi',
      home: MainPage(),
      initialRoute: '/start',
      routes: _routes,
      theme: _eduTheme,
    );
  }
}

final ThemeData _eduTheme = _buildEduTheme();

ThemeData _buildEduTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: eduPrimary,
    buttonColor: eduPrimary,
    scaffoldBackgroundColor: eduBackgroundWhite,
    
    buttonTheme: ButtonThemeData(buttonColor: Colors.yellow)
  );
}
