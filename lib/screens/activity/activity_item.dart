import 'package:flutter/material.dart';

import '../../models/activity.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;

  ActivityItem(this.activity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/homework'),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 5.0, color: activity.leftBorderColor))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(activity.imageUrl),
                  ),
                ),
              ),
              SizedBox(
                width: 28.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          activity.subject,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          activity.timeStamp,
                          style: TextStyle(color: Color(0xFF3A3E41)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      activity.author,
                      style: TextStyle(color: Color(0xFF3A3E41)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(activity.description, style: TextStyle(fontSize: 16.0)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('2 exercise'),
                        SizedBox(
                          width: 24.0,
                        ),
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('1 homework'),
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
