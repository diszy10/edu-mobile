import 'package:flutter/material.dart';

import '../../models/updates.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _updatesList = <Updates>[
      Updates(1, content: 'Parent meeting'),
      Updates(2, content: 'Ms. Luna teach math'),
      Updates(3, content: 'New homework assignment for Raline')
    ];

    Widget _buildPageTitle = Padding(
        padding: EdgeInsets.only(left: 32.0, top: 32.0, bottom: 8.0),
        child: Text('Updates',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)));

    Widget _buildDate = Padding(
        padding: EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
        child: Text('Today, 1 March 2019',
            style: TextStyle(color: Color(0xFF3A3E41), fontSize: 16.0)));

    Widget _buildUpdateList(List<Updates> updatesList) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: updatesList.length,
        itemBuilder: (BuildContext context, index) {
          return Dismissible(
            key: Key(updatesList[index].id.toString()),
            child: InkWell(
              onTap: () {},
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
                  child: Text(updatesList[index].content,
                      style: TextStyle(fontSize: 16.0))),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildPageTitle,
                _buildDate,
                _buildUpdateList(_updatesList)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
