import 'package:flutter/material.dart';
import '../../widgets/gradient_text_color.dart';

class UpdateHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;
    return Container(
      margin: EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BluePurpleGradientText(text: 'Updates', fontSize: titleFontSize),
          Text('Today, 1 March 2019',
              style: TextStyle(color: Color(0xFF3A3E41), fontSize: 16.0))
        ],
      ),
    );
  }
}
