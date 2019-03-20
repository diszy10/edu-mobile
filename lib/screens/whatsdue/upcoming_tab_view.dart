import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/app_model.dart';
import '../../models/due.dart';
import '../../models/upcoming.dart';
import './homework_modal.dart';

class UpcomingTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final _upcomingList = <Due>[
    //   Due(day: 'WED', date: '12', timestamp: 'Today', upcoming: [
    //     Upcoming(
    //         subject: 'Math & Logic',
    //         totalHomework: 2,
    //         topic: 'Decimal fractions and place value patterns',
    //         dueDate: 'Monday, 10 March 2019',
    //         homework: [
    //           Homework(1, 'Multiply and divide decimals by 10, 100 and 1000',
    //               '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
    //           Homework(2, 'Place Value and Rounding',
    //               '100+60+1 = ... \n90+80+3 = ...\n120+76+90 = ...\n250+123+9 = ...')
    //         ]),
    //     Upcoming(subject: 'Science', totalHomework: 3, topic: 'Yuna'),
    //     Upcoming(
    //         subject: 'Indonesian (Language & Literature)',
    //         totalHomework: 1,
    //         topic: 'Yuna')
    //   ]),
    //   Due(day: 'THU', date: '13', timestamp: 'Tomorrow', upcoming: [
    //     Upcoming(subject: 'Physics', totalHomework: 2, topic: 'Yuna'),
    //     Upcoming(
    //         subject: 'Korean (Language & Literature)',
    //         totalHomework: 1,
    //         topic: 'Yuna'),
    //   ])
    // ];

    Widget _buildUpcomingFeed(List<Due> due) {
      return ListView.builder(
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
      backgroundColor: Color(0xFFF7F8F9),
      body: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) =>
              _buildUpcomingFeed(model.upcomingList)),
    );
  }
}

class RowDate extends StatelessWidget {
  final Due due;
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
                  due.dayShort,
                  style: TextStyle(
                      color: Color(0xFF2C3235), fontWeight: FontWeight.bold),
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
                  due.day,
                  style: TextStyle(color: Colors.grey),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Color(0xFFEEEFEF), width: 1.5)),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: Color(0xFF737373),
                  child: Container(
                    height: 650.0,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        )),
                    child: HomeworkModal(upcoming),
                  ),
                );
              });
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                upcoming.subject,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: 'Circular'),
              ),
              SizedBox(height: 4.0),
              Text(upcoming.totalHomework.toString() + ' homeworks',
                  style: TextStyle(color: Colors.grey))
            ],
          ),
        ),
      ),
    );
  }
}
