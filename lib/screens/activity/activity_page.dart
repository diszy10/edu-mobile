import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './activity_header.dart';
import '../../scoped_models/app_model.dart';
import '../../models/activity.dart';
import '../../widgets/timeline/timeline.dart';
import '../../widgets/timeline/timeline_model.dart';
import './performance_page.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetHeight = deviceHeight > 640.0 ? 138.0 : 114.0;
    final double targetPadding = deviceHeight > 640.0 ? 52.0 : 42.0;

    Widget _buildActivityFeed(List<Activity> activityFeed) {
      return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: activityFeed.length,
        itemBuilder: (_, int index) {
          Activity activity = activityFeed[index];
          return TeacherActivity(activity);
        },
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(targetHeight),
        child: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.history), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.insert_chart),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PerformancePage()))),
          ],
          flexibleSpace: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color(0xFFE8E8E8), width: 1.0))),
              margin: EdgeInsets.only(top: targetPadding),
              child: ActivityHeader(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ScopedModelDescendant<AppModel>(
                      builder: (context, child, model) =>
                          _buildActivityFeed(model.activityList)),
                ]),
          ),
        ),
      ),
    );
  }
}

class TeacherActivity extends StatelessWidget {
  final Activity activity;

  TeacherActivity(this.activity);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double nameFontSize = deviceHeight > 640.0 ? 18.0 : 16.0;

    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: Column(
        children: <Widget>[
          // Activity teacher section
          // Is now teaching
          activity.isTeaching == true
              ? new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Teacher Photo
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFF3FDE44), width: 3.0),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 38.0,
                          height: 38.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(activity.teacherPhoto),
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
                          Text(activity.teacherName,
                              style: TextStyle(
                                  fontSize: nameFontSize,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis),
                          SizedBox(height: 4.0),
                          Text(
                            activity.teacherSubject,
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
                            Icons.folder_shared,
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
                    )
                  ],
                )
              : new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Teacher Photo
                    Flexible(
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(activity.teacherPhoto),
                          ),
                        ),
                      ),
                    ),

                    // Teacher name & subject
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(activity.teacherName,
                              style: TextStyle(
                                  fontSize: nameFontSize,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis),
                          SizedBox(height: 4.0),
                          Text(
                            activity.teacherSubject,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Container()
                  ],
                ),

          // Activity class section
          Container(
            margin: EdgeInsets.only(top: 16.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Color(0xFFF7F8F9),
                border: Border(top: BorderSide(color: Colors.grey[200]))),
            // child: ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: activity.activityClass.length,
            //   itemBuilder: (context, index) {
            //     return TeacherActivityItem(activity.activityClass[index]);
            //   },
            // ),
            child: timelineModel(TimelinePosition.Left),
          ),
        ],
      ),
    );
  }

  timelineModel(TimelinePosition position) => Timeline.builder(
      itemBuilder: teacherActivityItem,
      itemCount: activity.activityClass.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      position: position);

  TimelineModel teacherActivityItem(BuildContext context, int i) {
    final activityClass = activity.activityClass[i];
    return TimelineModel(
        Container(
          margin: EdgeInsets.only(bottom: 16.0, left: 16.0),
          child: Container(
              // padding: EdgeInsets.all(16.0),
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
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0)),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(activityClass.timeStamp,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4.0),
                        Text(
                          activityClass.content,
                          style: TextStyle(fontSize: 16.0),
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
        isFirst: i == 0,
        isLast: i == activity.activityClass.length,
        iconBackground: activityClass.shapeColor);
    // icon: Icon(Icons.settings, color: activityClass.iconColor));
  }
}

// class TeacherActivityItem extends StatelessWidget {
//   final ActivityClass activityClass;

//   TeacherActivityItem(this.activityClass);

//   @override
//   Widget build(BuildContext context) {
//     final double deviceHeight = MediaQuery.of(context).size.height;
//     final double iconMarginLeft = deviceHeight > 640.0 ? 12.0 : 5.0;

//     return new Container(
//       margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//               Container(
//                 // width: 16.0,
//                 margin: EdgeInsets.only(left: iconMarginLeft, right: 16.0),
//                 padding: EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                     color: activityClass.shapeColor, shape: BoxShape.circle),
//                 // child: Container(),
//                 child: Icon(Icons.settings,
//                     size: 20.0, color: activityClass.iconColor),
//               ),
//             ],
//           ),
//           Flexible(
//             child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadiusDirectional.only(
//                       topEnd: Radius.circular(8.0),
//                       bottomStart: Radius.circular(8.0),
//                       bottomEnd: Radius.circular(8.0)),
//                   boxShadow: <BoxShadow>[
//                     BoxShadow(
//                       color: Colors.grey[300],
//                       offset: Offset(1.0, 3.0),
//                       blurRadius: 4.0,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(activityClass.timeStamp,
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                     SizedBox(height: 4.0),
//                     Text(activityClass.content)
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
