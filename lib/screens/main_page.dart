import 'package:flutter/material.dart';
import '../presentation/custom_icons_icons.dart';

import './activity/activity_page.dart';
import './whatsdue/whats_due_page.dart';
import './inbox/inbox_page.dart';
import './update/update_page.dart';
import './account/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  final _pageOptions = [
    ActivityPage(),
    WhatsDuePage(),
    InboxPage(),
    UpdatePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 28.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.icon_activity, size: 20.0, color: Color(0xFFA7AAAC)),
              activeIcon: Icon(CustomIcons.icon_activity, size: 20.0, color: Theme.of(context).primaryColor),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.icon_duedate, size: 20.0, color: Color(0xFFA7AAAC)),
              activeIcon: Icon(CustomIcons.icon_duedate, size: 20.0, color: Theme.of(context).primaryColor),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.icon_inbox, size: 20.0, color: Color(0xFFA7AAAC)), 
              activeIcon: Icon(CustomIcons.icon_inbox, size: 20.0, color: Theme.of(context).primaryColor), 
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.icon_notifications, size: 20.0, color: Color(0xFFA7AAAC)),
              activeIcon: Icon(CustomIcons.icon_notifications, size: 20.0, color: Theme.of(context).primaryColor),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Container(
                width: 24.0,
                height: 24.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        'http://cdn2.tstatic.net/style/foto/bank/images/raisa-andriana_20180614_154024.jpg'),
                  ),
                ),
              ),
              title: Text('')),
        ],
      ),
    );
  }
}
