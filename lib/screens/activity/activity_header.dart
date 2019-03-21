import 'package:flutter/material.dart';

class ActivityHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _todayClass = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text('Today class',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
    );

    Widget _kidAvatar(
        [String imageUrl =
            'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg']) {
      return Container(
        margin: EdgeInsetsDirectional.only(top: 16.0),
        width: 60.0,
        height: 60.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new NetworkImage(imageUrl),
          ),
        ),
      );
    }

    /// Accepts [String] text and optional [TextStyle] style
    /// Returns [Text]
    Widget _date(String text,
        {TextStyle style = const TextStyle(
            color: Color(0xFF3A3E41),
            fontSize: 16.0,
            fontWeight: FontWeight.normal)}) {
      return Text(text, style: style);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _kidAvatar(),
          _todayClass,
          _date('2 March 2019')
        ],
      ),
    );
  }
}
