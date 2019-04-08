import 'package:flutter/material.dart';

import '../../models/homework.dart';

class HomeworkList extends StatelessWidget {
  final Homework homework;
  HomeworkList(this.homework);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double lessonFontSize = deviceHeight > 640.0 ? 20.0 : 18.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Meta info homework
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Homeworks ' + homework.no.toString(),
                style: TextStyle(fontSize: 14.0, color: Color(0xFFB2B6B9)),
              ),
              Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xFFC1FFC6),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.done, size: 14.0, color: Color(0xFF21A62A)),
                      Text('Submitted',
                          style: TextStyle(
                              fontSize: 14.0, color: Color(0xFF21A62A))),
                    ],
                  ))
            ],
          ),
          // Title homework
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              homework.lesson,
              style: TextStyle(
                  fontSize: lessonFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          // Content homework
          Container(
              child: Text(homework.content,
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF838C97)),
                  maxLines: 3))
        ],
      ),
    );
  }
}
