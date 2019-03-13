import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class BluePurpleGradientText extends StatefulWidget {
  final String title;
  BluePurpleGradientText({String title}) : this.title = title;

  _BluePurpleState createState() => new _BluePurpleState(title);
}

class _BluePurpleState extends State<BluePurpleGradientText> {
  _BluePurpleState(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GradientText(this.title,
        gradient: LinearGradient(colors: [
          Color(0xff735AFF),
          Color(0xff43A1FF),
        ]),
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center);
  }
}

class OrangeMagentaGradientText extends StatefulWidget {
  final String title;
  OrangeMagentaGradientText({String title}) : this.title = title;

  _BluePurpleState createState() => new _BluePurpleState(title);
}

class _OrangeMagenta extends State<OrangeMagentaGradientText> {
  _OrangeMagenta(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return GradientText(this.title,
        gradient: LinearGradient(colors: [
          Color(0xffFF9344),
          Color(0xffFF2B8B),
        ]),
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center);
  }
}
