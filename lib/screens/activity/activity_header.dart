import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';

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

    Widget _gempiKid = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(
                    'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg'),
              ),
            ),
          ),
          SizedBox(width: 24.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Gempi',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Banana class',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget _rafatarKid = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.cover,
                image: new NetworkImage(
                    'https://img.okeinfo.net/content/2017/06/19/33/1720301/foto-makin-tampan-rafathar-kalahkan-raffi-ahmad-LzkVtyuJaz.jpg'),
              ),
            ),
          ),
          SizedBox(width: 24.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Rafatar',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Apple class',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // TODO: Implements Kid List View for switching between each Kid feeds
        // TODO: Implements real time for date text
        children: <Widget>[
          GestureDetector(
              onTap: () {
                showRoundedModalBottomSheet(
                  context: context,
                  radius: 10.0, // This is the default
                  color: Colors.white, // Also default
                  builder: (context) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          // Border top
                          Container(
                            margin: EdgeInsets.only(top: 24.0),
                            width: 40.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          SizedBox(height: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 32.0, bottom: 16.0),
                                child: Text(
                                  'Switch Kids',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              _gempiKid,
                              _rafatarKid
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: _kidAvatar()),
          _todayClass,
          _date('2 March 2019')
        ],
      ),
    );
  }
}
