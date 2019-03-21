import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../presentation/custom_icons_icons.dart';

import './activity/activity_page.dart';
import './whatsdue/whatsdue_page.dart';
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
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double iconSize = deviceHeight > 640.0 ? 24.0 : 20.0;

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark, child: _pageOptions[_selectedPage]),
      bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(CustomIcons.icon_activity,
                  size: iconSize, color: Color(0xFFA7AAAC)),
              activeIcon: Icon(CustomIcons.icon_activity,
                  size: iconSize, color: Theme.of(context).primaryColor),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.icon_duedate,
                  size: iconSize, color: Color(0xFFA7AAAC)),
              activeIcon: Icon(CustomIcons.icon_duedate,
                  size: iconSize, color: Theme.of(context).primaryColor),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.icon_inbox,
                  size: iconSize, color: Color(0xFFA7AAAC)),
              activeIcon: Icon(CustomIcons.icon_inbox,
                  size: iconSize, color: Theme.of(context).primaryColor),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.icon_notifications,
                  size: iconSize, color: Color(0xFFA7AAAC)),
              activeIcon: Icon(CustomIcons.icon_notifications,
                  size: iconSize, color: Theme.of(context).primaryColor),
              title: Text('')),
          BottomNavigationBarItem(
              icon: Container(
                width: 26.0,
                height: 26.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.workingmother.com/sites/workingmother.com/files/styles/1000_1x_/public/images/2016/10/emily_blunt.jpg?itok=uRNPOZ2B&fc=50,50'),
                  ),
                ),
              ),
              title: Text('')),
        ],
      ),
    );
  }
}
