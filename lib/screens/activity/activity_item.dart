import 'package:flutter/material.dart';

import '../../models/activity.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;

  ActivityItem(this.activity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 5.0, color: activity.leftBorderColor))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new NetworkImage(
                          activity.imageUrl),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          activity.subject,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          activity.timeStamp,
                          style: TextStyle(color: Color(0xFF3A3E41)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      activity.author,
                      style: TextStyle(color: Color(0xFF3A3E41)),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(activity.description,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.library_books, color: Colors.black45,),
                            Text('2 exercise')
                          ],
                        ),
                        SizedBox(width: 16.0),
                        Row(
                          children: <Widget>[
                            Icon(Icons.library_books, color: Colors.black45,),
                            Text('1 homework')
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
