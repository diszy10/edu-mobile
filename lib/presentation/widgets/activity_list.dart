import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final Activity activity;

  ActivityList({@required this.activity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_buildRowHeader(context), _buildTimelineList()],
    );
  }

  Widget _buildRowHeader(BuildContext context) {
    final bool isTeaching = activity.isTeaching == true;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: isTeaching
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /// Teacher photo
                Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF3FDE44), width: 2.0),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(activity.urlPhoto),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.0),

                /// Teacher name & subject text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        activity.teacherName,
                        style: TextStyle(
                            fontFamily: 'Circular',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        activity.teacherSubject,
                        style: TextStyle(
                          fontFamily: 'Circular Book',
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(width: 4.0),

                /// Now teaching indicator icon
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFC2FEC8),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: <Widget>[
                      mediaDevice(context)
                          ? Icon(
                              Icons.folder_shared,
                              color: Color(0xFF1AA424),
                              size: 18.0,
                            )
                          : Container(),
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
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                /// Teacher photo
                Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(activity.urlPhoto),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),

                /// Teacher name & subject text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(activity.teacherName,
                          style: TextStyle(
                              fontFamily: 'Circular',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis),
                      SizedBox(height: 4.0),
                      Text(activity.teacherSubject,
                          style: TextStyle(
                            fontFamily: 'Circular Book',
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis)
                    ],
                  ),
                ),
                Container()
              ],
            ),
    );
  }

  Widget _buildTimelineList() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300], width: 1.0),
        ),
      ),
      child: ListView.builder(
        key: PageStorageKey('classactivity_list'),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: activity.classActivity.length,
        itemBuilder: (context, index) {
          final classActivity = activity.classActivity[index];
          final itemCount = activity.classActivity.length;
          final isFirst = index == 0;
          final isLast = index == (itemCount - 1);
          return ActivityTimelineList(isFirst, isLast,
              classActivity: classActivity);
        },
      ),
    );
  }
}

class ActivityTimelineList extends StatelessWidget {
  final ClassActivity classActivity;
  final bool isFirst, isLast;

  ActivityTimelineList(this.isFirst, this.isLast,
      {@required this.classActivity});

  @override
  Widget build(BuildContext context) {
    final Size media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Color(0xFFF7F8F9),
      child: Row(
        children: <Widget>[
          _buildTimeline(context, media),
          SizedBox(width: 24.0),
          _buildCard(),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, Size media) {
    return Flexible(
      child: Container(
        decoration: TimelineBoxDecoration(
            isFirst, isLast, classActivity.dotColor, media),
      ),
    );
  }

  Widget _buildCard() {
    return Flexible(
      flex: 6,
      child: Container(
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
                  /// Timestamp text
                  Text(classActivity.timestamp,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4.0),

                  /// Activity content text
                  Text(
                    classActivity.content,
                    style: TextStyle(
                      fontFamily: 'Circular Book',
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
