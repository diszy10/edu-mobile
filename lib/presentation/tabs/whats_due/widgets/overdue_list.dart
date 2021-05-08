import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/tabs/whats_due/widgets/overdue_bottom_sheet.dart';
import 'package:flutter/material.dart';

class OverdueList extends StatelessWidget {
  final Due due;

  OverdueList({@required this.due});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Text(due.dayOfWeek,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF838C97))),
                Text(
                  due.date,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF838C97)),
                )
              ],
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(flex: 6, child: _buildOverdueList(due))
        ],
      ),
    );
  }

  Widget _buildOverdueList(Due due) {
    return ListView.builder(
      key: PageStorageKey('overdue_list'),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: due.overdue.length,
      itemBuilder: (context, index) => OverdueCard(due.overdue[index]),
    );
  }
}

class OverdueCard extends StatelessWidget {
  final Overdue overdue;

  OverdueCard(this.overdue);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Color(0xFFEEEFEF), width: 1.5)),
        child: _buildOverdueCard(context, overdue));
  }

  Widget _buildOverdueCard(BuildContext context, Overdue overdue) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showCustomModalBottomSheet(
            context: context,
            builder: (context) => OverdueBottomSheet(overdue: overdue)),
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Subject text
              Text(overdue.subject,
                  style: TextStyle(
                    fontFamily: 'Circular',
                    fontSize: 16.0,
                  ),
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: 4.0),

              /// Total homeworks text
              Text(overdue.totalHomeWorks.toString() + ' homeworks',
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF848C97)))
            ],
          ),
        ),
      ),
    );
  }
}
