import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/shared/gradient_text.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/tabs/whats_due/widgets/widgets.dart';
import 'package:flutter/material.dart';

class WhatsDuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBar(context, 'whatsdue')),
      child: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: _buildTopSpace(context),
        bottom: _buildTabBar(context),
      ),
    );
  }

  Widget _buildTopSpace(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 16.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Page title
            BluePurpleGradientText(
                text: 'What\'s Due', fontSize: titleSize(context)),
            SizedBox(height: 8.0),

            /// Page subtitle
            Text(
              'Homeworks due date',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF989B9C),
              ),
            ),
            SizedBox(height: 32.0)
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(context) {
    return TabBar(
      unselectedLabelColor: Colors.black,
      labelColor: Theme.of(context).primaryColor,
      indicatorColor: Theme.of(context).primaryColor,
      indicatorWeight: 3,
      tabs: [
        Tab(
          child: Text(
            'Upcoming',
            style: TextStyle(
              fontFamily: 'Okomito',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Overdue',
                style: TextStyle(
                  fontFamily: 'Okomito',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 4.0),
              Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepOrange),
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: TabBarView(
        children: <Widget>[UpcomingTabView(), OverdueTabView()],
      ),
    );
  }
}

class UpcomingTabView extends StatelessWidget {
  final _upcomingList = [
    Due(
        dayOfWeek: 'Wed',
        date: '18',
        deadline: 'Today',
        totalHomeworks: 3,
        upcoming: [
          Upcoming(
              subject: 'Math & Logic',
              totalHomeWorks: 2,
              topic: 'Decimal fractions and place value patterns',
              dueDate: 'Wednesday, 18 November 2019',
              homework: [
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
              ]),
          Upcoming(
              subject: 'Korean (Language & Literature)',
              totalHomeWorks: 1,
              topic: 'EYD',
              dueDate: 'Wednesday, 18 March 2019',
              homework: [
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...')
              ]),
        ]),
    Due(
        dayOfWeek: 'Thu',
        date: '19',
        deadline: 'Tomorrow',
        totalHomeworks: 2,
        upcoming: [
          Upcoming(
              subject: 'Science',
              totalHomeWorks: 1,
              topic: 'Decimal fractions and place value patterns',
              dueDate: 'Thursday, 19 March 2019',
              homework: [
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
              ]),
          Upcoming(
              subject: 'English',
              totalHomeWorks: 1,
              topic: 'EYD',
              dueDate: 'Thursday, 19 March 2019',
              homework: [
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
                Homework(
                    title: 'Multiply and divide decimals by 10, 100 and 1000',
                    content:
                        '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
              ]),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDueList(_upcomingList);
  }

  Widget _buildDueList(List<Due> due) {
    return ListView.builder(
      key: PageStorageKey('upcoming_list'),
      itemCount: due.length,
      itemBuilder: (context, index) => UpcomingList(due: due[index]),
    );
  }
}

class OverdueTabView extends StatelessWidget {
  final _overdueList = [
    Due(date: '14', dayOfWeek: 'MON', overdue: [
      Overdue(
          subject: 'Korean (Language & Literature)',
          topic: 'Decimal fractions and place value patterns',
          totalHomeWorks: 1,
          dueDate: 'Monday 14 March 2019',
          homework: [
            Homework(
                title: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...')
          ])
    ]),
    Due(date: '15', dayOfWeek: 'TUE', overdue: [
      Overdue(
          subject: 'Science',
          topic: 'Decimal fractions and place value patterns',
          totalHomeWorks: 2,
          dueDate: 'Monday 15 March 2019',
          homework: [
            Homework(
                title: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                title: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
          ]),
      Overdue(
          subject: 'Social',
          topic: 'Decimal fractions and place value patterns',
          totalHomeWorks: 1,
          dueDate: 'Monday 15 March 2019',
          homework: [
            Homework(
                title: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                title: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                title: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
            Homework(
                title: 'Multiply and divide decimals by 10, 100 and 1000',
                content:
                    '90.5x100 = ... \n6.33x100 = ... \n0.0047x100 = ... \n0.0047x100 = ... \n0.0047x100 = ...'),
          ])
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return _buildDueList(_overdueList);
  }

  Widget _buildDueList(List<Due> due) {
    return ListView.builder(
      key: PageStorageKey('overdue_list'),
      itemCount: due.length,
      itemBuilder: (context, index) => OverdueList(due: due[index]),
    );
  }
}
