import 'package:flutter/material.dart';

import './upcoming_section.dart';

class WhatsDuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.0),
          child: AppBar(
            elevation: 0.1,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: false,
            flexibleSpace: Container(
              margin: EdgeInsets.only(left: 24.0, top: 42.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('What\'s Due',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold)),
                  Text('Homeworks due date', style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child:
                      Text('Upcoming', style: TextStyle(color: Colors.black)),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Overdue', style: TextStyle(color: Colors.black)),
                      Container(
                          margin: EdgeInsets.only(left: 4.0),
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.deepOrange),
                          child: Text('2'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: TabBarView(
          children: [
            UpcomingSection(),
            Icon(Icons.directions_transit),
          ],
        )),
      ),
    );
  }
}
