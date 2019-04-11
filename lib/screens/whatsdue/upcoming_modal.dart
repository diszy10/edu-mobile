import 'package:flutter/material.dart';

import '../../models/upcoming.dart';
import '../../widgets/gradient_text_color.dart';
import './homework_list.dart';

class UpcomingModal extends StatelessWidget {
  UpcomingModal(this.upcoming);
  final Upcoming upcoming;

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
                          return UpcomingFullPage(upcoming);
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
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    size: 24.0,
                  ))
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
              text: upcoming.subject,
              fontSize: subjectFontSize,
            ),
          ),
          // Topic text
          Container(
            margin: EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
            child: Text(
              'Topic: ' + upcoming.topic,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF838C97),
                  fontFamily: 'Okomito'),
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
            child: upcoming.homework != null
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: upcoming.homework.length,
                    itemBuilder: (context, index) {
                      return HomeworkList(upcoming.homework[index]);
                    },
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}

class UpcomingFullPage extends StatelessWidget {
  final Upcoming upcoming;
  UpcomingFullPage(this.upcoming);

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
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 24.0),
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
                                  child: Text(
                                upcoming.homework[index].content,
                                style: TextStyle(
                                    fontSize: 16.0, 
                                    color: Color(0xFF838C97),
                                    height: 1.2),
                              ))
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
