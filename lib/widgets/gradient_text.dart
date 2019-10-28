import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  GradientText(this.text,
      {@required this.gradient, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        text,
        style: (style == null)
            ? TextStyle(color: Colors.white)
            : style.copyWith(color: Colors.white),
        textAlign: textAlign,
      ),
    );
  }
}

class BluePurpleGradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  BluePurpleGradientText(
      {@required this.text,
      @required this.fontSize,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      gradient: LinearGradient(colors: [Color(0xff735AFF), Color(0xff43A1FF)]),
      style: TextStyle(
          fontFamily: 'Circular', fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class OrangeMagentaGradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  OrangeMagentaGradientText(
      {@required this.text,
      @required this.fontSize,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      gradient: LinearGradient(colors: [Color(0xffFF9344), Color(0xffFF2B8B)]),
      style: TextStyle(
          fontFamily: 'Circular', fontSize: fontSize, fontWeight: fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
