import 'package:flutter/material.dart';

import 'package:edukasi_mobile/models/models.dart';
import 'package:edukasi_mobile/widgets/widgets.dart';

class UpcomingList extends StatelessWidget {
  final Due due;

  UpcomingList({@required this.due});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text(due.dayOfWeek,
                    style: TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.normal)),
                Text(
                  due.date,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(due.deadline,
                        style: TextStyle(
                            fontSize: 16.0, color: Color(0xFF939BA4))),
                    Text(due.totalHomeworks.toString() + ' homeworks',
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xFF848D98)))
                  ],
                ),
                _buildUpcomingList(due)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUpcomingList(Due due) {
    return ListView.builder(
      key: PageStorageKey('upcoming_list'),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: due.upcoming.length,
      itemBuilder: (context, index) => UpcomingCard(due.upcoming[index]),
    );
  }
}

class UpcomingCard extends StatelessWidget {
  final Upcoming upcoming;

  UpcomingCard(this.upcoming);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Color(0xFFEEEFEF), width: 1.5),
        ),
        child: _buildUpcomingCard(context, upcoming));
  }

  Widget _buildUpcomingCard(BuildContext context, Upcoming upcoming) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showCustomModalBottomSheet(
            context: context,
            builder: (context) => UpcomingBottomSheet(upcoming: upcoming)),
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                upcoming.subject,
                style: TextStyle(
                  fontFamily: 'Circular',
                  fontSize: 16.0,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.0),
              Text(upcoming.totalHomeWorks.toString() + ' homeworks',
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF848C97)))
            ],
          ),
        ),
      ),
    );
  }
}
