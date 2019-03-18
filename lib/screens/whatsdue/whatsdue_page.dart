import 'package:flutter/material.dart';

import './upcoming_tab_view.dart';
import './overdue_tab_view.dart';
import '../../widgets/gradient_text_color.dart';

class WhatsDuePage extends StatelessWidget {
  final String title = 'What\'s Due';

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetHeight = deviceHeight > 640.0 ? 152.0 : 144.0;
    final double targetPadding = deviceHeight > 640.0 ? 32.0 : 24.0;
    final double targetFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(targetHeight),
          child: AppBar(
            elevation: 0.1,
            backgroundColor: Colors.white,
            flexibleSpace: SafeArea(
              child: Container(
                margin: EdgeInsets.only(left: 24.0, top: targetPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: BluePurpleGradientText(
                        text: 'What\'s Due',
                        fontSize: targetFontSize,
                      ),
                    ),
                    Text(
                      'Homeworks due date',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  child: Text('Upcoming', style: TextStyle(fontSize: 16.0)),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Overdue', style: TextStyle(fontSize: 16.0)),
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
