import 'package:flutter/material.dart';

import '../../models/homework.dart';
import '../../models/overdue.dart';
import '../../widgets/gradient_text_color.dart';
import './overdue_homework_page.dart';

class OverdueHomeworkModal extends StatelessWidget {
  OverdueHomeworkModal(this.overdue);
  final Overdue overdue;

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double subjectFontSize = deviceHeight > 640.0 ? 28.0 : 24.0;

    return Container(
      child: Column(
        children: <Widget>[
          // Arrow top to slide into homework_page
          InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(new MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                          return OverdueHomeworkPage(overdue);
                        },
                        fullscreenDialog: true));
              },
              child: Container(
                      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      padding: EdgeInsets.all(2.0),
                      // decoration: BoxDecoration(
                      //   color: Theme.of(context).primaryColor.withOpacity(0.1),
                      //   shape: BoxShape.circle,
                      // ),
                      child: Icon(Icons.keyboard_arrow_up,
                          size: 24.0, ))
              // Strip Card
              // Center(
              //   child: Container(
              //     margin: EdgeInsets.only(top: 16.0),
              //     width: 38.0,
              //     height: 4.0,
              //     decoration: BoxDecoration(
              //         color: Colors.grey,
              //         borderRadius: BorderRadius.circular(10.0)),
              //   ),
              // ),
              ),
          // Subject text
          Container(
            child: OrangeMagentaGradientText(
              text: overdue.subject,
              fontSize: subjectFontSize,
            ),
          ),
          // Topic text
          Container(
            margin: EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
            child: Text(
              'Topic: ' + overdue.topic,
              style: TextStyle(fontSize: 16.0, color: Color(0xFF838C97), fontFamily: 'Okomito'),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(color: Colors.grey[300]),
          // Due date text
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.movie, color: Color(0xFFFF5B30)),
                SizedBox(width: 6.0),
                Text('Due on', style: TextStyle(color: Color(0xFF8A939D))),
                SizedBox(width: 4.0),
                Text(
                  'Monday, 10 March 2019',
                  style: TextStyle(color: Color(0xFFFF5B30)),
                )
              ],
            ),
          ),
          Divider(color: Colors.grey[300]),
          Expanded(
            child: overdue.homework != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: overdue.homework.length,
                    itemBuilder: (context, index) {
                      return HomeworksList(overdue.homework[index]);
                    },
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}

class HomeworksList extends StatelessWidget {
  final Homework homework;
  HomeworksList(this.homework);

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
