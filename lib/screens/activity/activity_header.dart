import 'package:flutter/material.dart';
import '../../widgets/gradient_text_color.dart';

class ActivityHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;
    final double nameFontSize = deviceHeight > 640.0 ? 17.0 : 14.0;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24.0),
            child: BluePurpleGradientText(
              text: 'Activity',
              fontSize: titleFontSize,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24.0),
            child: Text(
              'Cantika Fonda',
              style: TextStyle(color: Colors.grey, fontSize: nameFontSize),
            ),
          ),
          SizedBox(height: 14.0),
          Divider(color: Colors.grey)
        ],
      ),
    );
  }
}
