import 'package:flutter/material.dart';

import './activity_header.dart';
import './activity_item.dart';
import '../../models/activity.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _activityFeed = <Activity>[
      Activity('Math & Logic', 'Ms. Ariana', '1 hour ago',
          'Teach "Decimal fractions and place value patterns"',
          leftBorderColor: Theme.of(context).primaryColor),
      Activity(
          'Science', 'Ms. Luna', '3 hours ago', 'Teach "All type of Forces"',
          leftBorderColor: Color(0xFF5BEDD7),
          imageUrl:
              'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg'),
      Activity(
        'English',
        'Ms. Yuna',
        '4 hours ago',
        'Teach "Grammar: 4 kinds of Conditional"',
        leftBorderColor: Color(0xFFE9ED5B),
        imageUrl:
            'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg',
      ),
    ];

    Widget _buildActivityFeed(List<Activity> activityFeed) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: activityFeed.length,
        itemBuilder: (_, int index) {
          Activity activity = activityFeed[index];
          return ActivityItem(activity);
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: FractionallySizedBox(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ActivityHeader(),
                SizedBox(height: 8.0),
                Expanded(child: _buildActivityFeed(_activityFeed))
              ]),
        ),
      ),
    );
  }
}
