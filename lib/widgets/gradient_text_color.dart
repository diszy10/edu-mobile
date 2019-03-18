import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class BluePurpleGradientText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  BluePurpleGradientText({this.text, this.fontWeight, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      this.text,
      gradient: LinearGradient(colors: [
        Color(0xff735AFF),
        Color(0xff43A1FF),
      ]),
      style: TextStyle(fontSize: this.fontSize, fontWeight: this.fontWeight),
      textAlign: TextAlign.center,
    );
  }
}

class OrangeMagentaGradientText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;

  OrangeMagentaGradientText({this.text, this.fontWeight, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      this.text,
      gradient: LinearGradient(colors: [
        Color(0xffFF9344),
        Color(0xffFF2B8B),
      ]),
      style: TextStyle(fontSize: this.fontSize, fontWeight: this.fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
