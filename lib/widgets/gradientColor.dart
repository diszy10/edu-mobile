import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class BluePurpleGradientText extends StatefulWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  const BluePurpleGradientText({Key key, this.text, this.fontWeight, this.fontSize}) : super(key: key);

  _BluePurpleGradientTextState createState() => new _BluePurpleGradientTextState(text, fontWeight, fontSize);
}

class _BluePurpleGradientTextState extends State<BluePurpleGradientText> {
  _BluePurpleGradientTextState(this.text, this.fontWeight, this.fontSize);
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GradientText(this.text,
        gradient: LinearGradient(colors: [
          Color(0xff735AFF),
          Color(0xff43A1FF),
        ]),
        style: TextStyle(fontSize: this.fontSize, fontWeight: this.fontWeight),
        textAlign: TextAlign.center);
  }
}


class OrangeMagentaGradientText extends StatefulWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  const OrangeMagentaGradientText({Key key, this.text, this.fontWeight, this.fontSize}) : super(key: key);

  _OrangeMagentaState createState() => new _OrangeMagentaState(text, fontWeight, fontSize);
}

class _OrangeMagentaState extends State<OrangeMagentaGradientText> {
  _OrangeMagentaState(this.text, this.fontWeight, this.fontSize);
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GradientText(this.text,
        gradient: LinearGradient(colors: [
          Color(0xffFF9344),
          Color(0xffFF2B8B),
        ]),
        style: TextStyle(fontSize: this.fontSize, fontWeight: this.fontWeight),
        textAlign: TextAlign.center);
  }
}
