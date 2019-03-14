import 'package:flutter/material.dart';
import 'package:rounded_modal/rounded_modal.dart';

import '../../models/due.dart';
import '../../models/upcoming.dart';
import '../../models/homework.dart';

class UpcomingTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _dueList = <Due>[
      Due(day: 'WED', date: '12', timestamp: 'Today', upcoming: [
        Upcoming(
            subject: 'Math & Logic',
            totalHomework: '2',
            assignedBy: 'Ratna Wulandari',
            homework: [
              Homework(1, 'Multiply and divide decimals by 10, 100 and 1000',
                  '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
              Homework(1, 'Multiply and divide decimals by 10, 100 and 1000',
                  '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ...'),
            ]),
        Upcoming(subject: 'Science', totalHomework: '3', assignedBy: 'Yuna'),
        Upcoming(
            subject: 'Indonesian (Language & Literature)',
            totalHomework: '1',
            assignedBy: 'Reina')
      ]),
      Due(day: 'THU', date: '13', timestamp: 'Tomorrow', upcoming: [
        Upcoming(subject: 'Physics', totalHomework: '2', assignedBy: 'Ariana'),
        Upcoming(
            subject: 'Korean (Language & Literature)',
            totalHomework: '1',
            assignedBy: 'Regina'),
      ])
    ];

    Widget _buildDueFeed(List<Due> due) {
      return ListView.builder(
        // physics: BouncingScrollPhysics(),
        // shrinkWrap: true,
        itemCount: due.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
            child: RowDate(due[index]),
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: Color(0xFFF7F8F9), body: _buildDueFeed(_dueList));
  }
}

class RowDate extends StatelessWidget {
  Due due;
  RowDate(this.due);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(right: 24.0),
            child: Column(
              children: <Widget>[
                Text(
                  due.day,
                  style: TextStyle(color: Color(0xFF2C3235)),
                ),
                Text(
                  due.date,
                  style: TextStyle(
                      color: Color(0xFF2C3235),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  due.timestamp,
                  style: TextStyle(color: Colors.grey),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: due.upcoming.length,
                  itemBuilder: (context, index) {
                    return RowCard(due.upcoming[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RowCard extends StatelessWidget {
  final Upcoming upcoming;
  RowCard(this.upcoming);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showRoundedModalBottomSheet(
          context: context,
          radius: 10.0,
          autoResize: false,
          color: Colors.white,
          builder: (context) {
            return Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Border top
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return HomeworkPage();
                            },
                            fullscreenDialog: true));
                      },
                      child: Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.keyboard_arrow_up,
                                  size: 24.0,
                                  color: Theme.of(context).primaryColor)))
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
                  Container(
                    margin: EdgeInsets.only(left: 16.0),
                    child: Text(
                      upcoming.subject,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    margin: EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Assigned by',
                            style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 5.0),
                        Text(
                          upcoming.assignedBy,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Divider(color: Colors.grey[300]),
                  SizedBox(height: 8.0),
                  HomeworkSection(upcoming.homework[0])
                  // upcoming.homework != null
                  //     ? ListView.builder(
                  //         shrinkWrap: true,
                  //         physics: BouncingScrollPhysics(),
                  //         itemCount: upcoming.homework.length,
                  //         itemBuilder: (context, index) {
                  //           return HomeworkSection(upcoming.homework[index]);
                  //         },
                  //       )
                  //     : Container()
                ],
              ),
            );
          },
        );
      },

      /// Card
      child: Container(
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Color(0xFFEEEFEF), width: 1.5)),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, top: 14.0, bottom: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                upcoming.subject,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(upcoming.totalHomework + ' homework')
            ],
          ),
        ),
      ),
    );
  }
}

class HomeworkSection extends StatelessWidget {
  Homework homework;
  HomeworkSection(this.homework);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Homeworks ' + homework.no.toString(),
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              homework.lesson,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              homework.desc,
              style: TextStyle(color: Colors.grey),
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}

class HomeworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Center(
        child: Text('Sup'),
      ),
    );
  }
}
