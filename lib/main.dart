import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './start.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edukasi Parent',
      home: StartPage(),
      theme: _eduTheme,
    );
  }
}

final ThemeData _eduTheme = _buildEduTheme();

ThemeData _buildEduTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Color(0xFF5B87EC),
    textTheme: _buildEduTextTheme(base.textTheme),
  );
}

TextTheme _buildEduTextTheme(TextTheme base) {
  return base.apply(fontFamily: 'Okomito');
}
