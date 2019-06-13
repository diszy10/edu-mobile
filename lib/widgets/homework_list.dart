import 'package:flutter/material.dart';

import 'package:edukasi_mobile/models/models.dart';
import 'package:edukasi_mobile/utils/widget_utils.dart' as util;

class HomeworkList extends StatelessWidget {
  final Homework homework;
  final int index;

  HomeworkList(this.index, {@required this.homework});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: <Widget>[_buildMeta(), _buildBody(context)],
      ),
    );
  }

  Widget _buildMeta() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Homeworks ' + index.toString(),
          style: TextStyle(color: Colors.grey),
        ),
        _buildStatus()
      ],
    );
  }

  Widget _buildStatus() {
    return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xFFC1FFC6),
            borderRadius: BorderRadius.circular(4.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.done, size: 16.0, color: Color(0xFF21A62B)),
            Text('Submitted',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1FA62A))),
          ],
        ));
  }

  Widget _buildBody(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.0),

        /// Homework title text
        Text(homework.title,
            style: TextStyle(
                fontSize: util.mediaDevice(context) ? 20.0 : 18.0,
                fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),

        /// Homework content text
        Text(homework.content,
            style: TextStyle(
                fontSize: util.mediaDevice(context) ? 16.0 : 14.0,
                color: Color(0xFF87909A),
                height: 1.5))
      ],
    );
  }
}
