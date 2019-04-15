import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';

import '../../scoped_models/app_model.dart';
import '../../models/due.dart';
import '../../models/overdue.dart';
import './overdue_modal.dart';
import '.././../widgets/bottom_sheet.dart' as CustomSheet;

class OverdueTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildDueFeed(List<Due> due) {
      return ListView.builder(
        itemCount: due.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: RowDate(due[index]));
        },
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: ScopedModelDescendant<AppModel>(builder: (context, child, model) {
        return _buildDueFeed(model.overdueList);
      }),
    );
  }
}

class RowDate extends StatelessWidget {
  final Due due;
  RowDate(this.due);

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EE').format(due.date);
    String date = DateFormat('dd').format(due.date);

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
                  day.toUpperCase(),
                  style: TextStyle(
                      color: Color(0xFF838C97), fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
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
                  itemCount: due.overdue.length,
                  itemBuilder: (context, index) {
                    return RowCard(due.overdue[index]);
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
  final Overdue overdue;
  RowCard(this.overdue);

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double modalHeight = deviceHeight > 640.0 ? 650.0 : 450.0;

    return Container(
      margin: EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(color: Color(0xFFEEEFEF), width: 1.5)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            CustomSheet.showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Color(0xFF737373),
                    height: modalHeight,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          )),
                      child: OverdueModal(overdue),
                    ),
                  );
                });
          },
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  overdue.subject,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontFamily: 'Circular'),
                ),
                SizedBox(height: 4.0),
                Text(overdue.totalHomework.toString() + ' homeworks',
                    style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
