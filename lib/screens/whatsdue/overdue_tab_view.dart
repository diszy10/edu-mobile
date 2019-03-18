import 'package:flutter/material.dart';

import '../../models/due.dart';
import '../../models/upcoming.dart';

class OverdueTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _overdueList = <Due>[
      Due(
          day: 'MON',
          date: '10',
          upcoming: [Upcoming(subject: 'Math & Logic', totalHomework: 3)]),
      Due(day: 'TUE', date: '11', upcoming: [
        Upcoming(subject: 'Physics', totalHomework: 2),
        Upcoming(subject: 'Korean (Language & Literature)', totalHomework: 1)
      ])
    ];

    Widget _buildDueFeed(List<Due> due) {
      return ListView.builder(
        itemCount: due.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
              child: RowDate(due[index]));
        },
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: _buildDueFeed(_overdueList),
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
        // Day and date section
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(top: 8.0, right: 16.0),
            child: Column(
              children: <Widget>[
                Text(
                  due.day,
                  style: TextStyle(
                      color: Color(0xFF838C97), fontWeight: FontWeight.bold),
                ),
                Text(
                  due.date,
                  style: TextStyle(
                      color: Color(0xFF838C97),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        // Card section
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
    );
  }
}
