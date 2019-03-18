import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';

class BluePurpleGradientText extends StatelessWidget {
  final String text;
  final double fontSize;

  BluePurpleGradientText({this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      this.text,
      gradient: LinearGradient(colors: [
        Color(0xff735AFF),
        Color(0xff43A1FF),
      ]),
      style: TextStyle(fontFamily: 'Circular', fontSize: this.fontSize, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}

class OrangeMagentaGradientText extends StatelessWidget {
  final String text;
  final double fontSize;

  OrangeMagentaGradientText({this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      this.text,
      gradient: LinearGradient(colors: [
        Color(0xffFF9344),
        Color(0xffFF2B8B),
      ]),
      style: TextStyle(fontFamily: 'Circular', fontSize: this.fontSize, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
    );
  }
}
