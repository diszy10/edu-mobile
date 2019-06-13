import 'package:flutter/material.dart';

import 'package:edukasi_mobile/models/models.dart';
import 'package:edukasi_mobile/widgets/widgets.dart';
import 'package:edukasi_mobile/utils/widget_utils.dart' as util;

class ActivityPage extends StatelessWidget {
  final _activityList = [
    Activity(
        teacherName: 'Tirtayasa Saragih',
        teacherSubject: 'Science',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg',
        isTeaching: true,
        classActivity: [
          ClassActivity(
              timestamp: '10.30',
              content: 'Tirtayasa distributed homeworks "Xenomorph Anatomy"',
              dotColor: Color(0xFFFFBA01)),
          ClassActivity(
              timestamp: '9.45',
              content: 'Teaching "Xenomorph Anatomy"',
              dotColor: Color(0xFF43e97b)),
          ClassActivity(
              timestamp: '9.30',
              content: 'Raline is absent in my class',
              dotColor: Color(0xFFFF8888)),
        ]),
    Activity(
        teacherName: 'Vanya Sitorus',
        teacherSubject: 'Math',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg',
        isTeaching: false,
        classActivity: [
          ClassActivity(
              timestamp: '08.50',
              content:
                  'Vanya distributed homeworks "Compared decimal place value"',
              dotColor: Color(0xFFFFBA01)),
          ClassActivity(
              timestamp: '07.30',
              content: 'Teaching "Decimals"',
              dotColor: Color(0xFF43e97b)),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildActivityList(_activityList),
    );
  }

  Widget _buildAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(util.appBar(context, 'activity')),
      child: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: _buildTopSpace(context),
      ),
    );
  }

  Widget _buildTopSpace(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 16.0, top: 24.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[300], width: 1.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Page title
            BluePurpleGradientText(
                text: 'Activity', fontSize: util.titleSize(context)),
            SizedBox(height: 8.0),

            /// Student name
            Text('Zalina Raine Wyllie',
                style: TextStyle(fontSize: 16.0, color: Color(0xFF989B9C))),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityList(List<Activity> activity) {
    return ListView.builder(
      key: PageStorageKey('activity_list'),
      shrinkWrap: true,
      itemCount: activity.length,
      itemBuilder: (context, index) => ActivityList(activity: activity[index]),
    );
  }
}
