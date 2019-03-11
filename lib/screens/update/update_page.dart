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
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Text('Updates',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)));

    Widget _buildUpdateList(List<Updates> updatesList) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: updatesList.length,
        itemBuilder: (BuildContext context, index) {
          return Dismissible(
            key: Key(updatesList[index].id.toString()),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(width: 5.0, color: Colors.blue))),
              child: Text(updatesList[index].content,
                  style: TextStyle(fontSize: 16.0))),
          );
        },
      );
    }
    
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildPageTitle,
                _buildUpdateList(_updatesList)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
