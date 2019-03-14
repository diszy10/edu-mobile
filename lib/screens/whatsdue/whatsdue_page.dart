import 'package:flutter/material.dart';

import './upcoming_tab_view.dart';
import './overdue_tab_view.dart';

class WhatsDuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetHeight = deviceHeight > 550.0 ? 130.0 : 130.0;
    // final double targetPadding = deviceWidth - targetWidth;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: AppBar(
            elevation: 0.1,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            centerTitle: false,
            flexibleSpace: Container(
              margin: EdgeInsets.only(left: 24.0, top: 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text('What\'s Due',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    'Homeworks due date',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  // text: 'Upcoming',
                  child:
                      Text('Upcoming', style: TextStyle(color: Colors.black)),
                ),
                Tab(
                  // text: 'Overdue',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Overdue', style: TextStyle(color: Colors.black)),
                      Container(
                          margin: EdgeInsets.only(left: 4.0),
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.deepOrange),
                          child: Text(
                            '2',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: TabBarView(
          children: [UpcomingTabView(), OverdueTabView()],
        )),
      ),
    );
  }
}
