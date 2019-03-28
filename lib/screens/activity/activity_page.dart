import 'package:flutter/material.dart';

import './activity_header.dart';
import './activity_item.dart';
import '../../models/activity.dart';
import '../../widgets/gradient_text_color.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double nameFontSize = deviceHeight > 640.0 ? 18.0 : 16.0;
    final double timelineTop = deviceHeight > 640.0 ? 50.0 : 50.0;
    final double timelineLeft = deviceHeight > 640.0 ? 46.0 : 39.0;
    final double iconMarginLeft = deviceHeight > 640.0 ? 12.0 : 5.0;

    // final _activityFeed = <Activity>[
    //   Activity('Math & Logic', 'Ms. Ariana', '1 hour ago',
    //       'Teach "Decimal fractions and place value patterns"',
    //       leftBorderColor: Theme.of(context).primaryColor),
    //   Activity(
    //       'Science', 'Ms. Luna', '3 hours ago', 'Teach "All type of Forces"',
    //       leftBorderColor: Color(0xFF5BEDD7),
    //       imageUrl:
    //           'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg'),
    //   Activity(
    //     'English',
    //     'Ms. Yuna',
    //     '4 hours ago',
    //     'Teach "Grammar: 4 kinds of Conditional"',
    //     leftBorderColor: Color(0xFFE9ED5B),
    //     imageUrl:
    //         'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg',
    //   ),
    // ];

    final _activityFeed = <Activity>[
      Activity(
          teacherName: 'Tirtayasa Saragih',
          teacherPhoto:
              'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg',
          teacherSubject: 'Science Teacher',
          isTeaching: true,
          activityClass: [
            ActivityClass(
                timeStamp: '10.50', content: 'Teaching "Xenomorph Anatomy"'),
          ])
    ];

    // Widget _buildActivityFeed(List<Activity> activityFeed) {
    //   return ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     shrinkWrap: true,
    //     itemCount: activityFeed.length,
    //     itemBuilder: (_, int index) {
    //       Activity activity = activityFeed[index];
    //       return ActivityItem(activity);
    //     },
    //   );
    // }

    Widget _buildTimeline() {
      return new Positioned(
        top: timelineTop,
        bottom: 0.0,
        left: timelineLeft,
        child: new Container(
          width: 1.0,
          color: Colors.grey,
        ),
      );
    }

    Widget _buildActivityNow() {
      return Container(
        child: Column(
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Teacher Photo
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF3FDE44), width: 3.0),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 38.0,
                      height: 38.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),

                // Teacher name & subject
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Tirtayasa Saragih',
                          style: TextStyle(
                              fontSize: nameFontSize,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 4.0),
                      Text(
                        'Science Teacher',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),

                // Now teaching indicator
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFC2FEC8),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.label,
                        color: Color(0xFF1AA424),
                        size: 18.0,
                      ),
                      SizedBox(
                        width: 4.0,
                      ),
                      Text('NOW TEACHING',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Color(0xFF2C9838),
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              margin: EdgeInsets.only(top: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFFF7F8F9),
                border: Border(top: BorderSide(color: Colors.grey[200]))
              ),
              child: Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(left: iconMarginLeft, right: 16.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFBA01), shape: BoxShape.circle),
                      child: Icon(Icons.settings,
                          size: 20.0, color: Color(0xFFB17C18)),
                    ),
                    Flexible(
                      child: Container(
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(8.0),
                                bottomStart: Radius.circular(8.0),
                                bottomEnd: Radius.circular(8.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey[300],
                                offset: Offset(1.0, 3.0),
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('10:00',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4.0),
                              Text('Teaching "Xenomorph Anatomy"')
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.history), onPressed: () {}),
          IconButton(icon: Icon(Icons.insert_chart), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: FractionallySizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[new ActivityHeader(), _buildActivityNow()]),
        ),
      ),
    );
  }
}

class ActivityHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;
    final double nameFontSize = deviceHeight > 640.0 ? 17.0 : 14.0;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 24.0),
            child: BluePurpleGradientText(
              text: 'Activity',
              fontSize: titleFontSize,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24.0),
            child: Text(
              'Cantika Fonda',
              style: TextStyle(color: Colors.grey, fontSize: nameFontSize),
            ),
          ),
          SizedBox(height: 14.0),
          Divider(color: Colors.grey),
          SizedBox(height: 8.0)
        ],
      ),
    );
  }
}

class Activity {
  final String teacherPhoto, teacherName, teacherSubject;
  final bool isTeaching;
  final List<ActivityClass> activityClass;

  Activity(
      {this.teacherPhoto,
      this.teacherName,
      this.teacherSubject,
      this.isTeaching,
      this.activityClass});
}

class ActivityClass {
  final String timeStamp;
  final String content;

  ActivityClass({this.timeStamp, this.content});
}
