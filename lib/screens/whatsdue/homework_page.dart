import 'package:flutter/material.dart';

import '../../models/upcoming.dart';
import '../../widgets/gradient_text_color.dart';

class HomeworkPage extends StatelessWidget {
  final Upcoming upcoming;
  HomeworkPage(this.upcoming);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double subjectFontSize = deviceHeight > 640.0 ? 28.0 : 24.0;
    final double lessonFontSize = deviceHeight > 640.0 ? 20.0 : 18.0;

    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context))
          ],
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            // Subject text
            Center(
              child: Container(
                child: OrangeMagentaGradientText(
                  text: upcoming.subject,
                  fontSize: subjectFontSize,
                ),
              ),
            ),
            // Topic text
            Container(
              margin: EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
              child: Text(
                'Topic: ' + upcoming.topic,
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
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
                  SizedBox(width: 4.0),
                  Text('Due on', style: TextStyle(color: Colors.grey)),
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
              child: upcoming.homework != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: upcoming.homework.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Total homework and submit tag
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Homeworks ' +
                                        upcoming.homework[index].no.toString(),
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey),
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Color(0xFFC1FFC6),
                                          borderRadius:
                                              BorderRadius.circular(4.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(Icons.done,
                                              size: 14.0,
                                              color: Color(0xFF21A62A)),
                                          Text('Submitted',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Color(0xFF21A62A))),
                                        ],
                                      ))
                                ],
                              ),
                              // Lesson title text
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  upcoming.homework[index].lesson,
                                  style: TextStyle(
                                      fontSize: lessonFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // Content text
                              Container(
                                child: Text(upcoming.homework[index].content,
                                    style: TextStyle(color: Colors.grey)),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  : Container(),
            )
          ],
        )));
  }
}
