import 'package:edukasi_mobile/widgets/bottom_navigation_bar.dart'
    as CustomNavBar;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './account/profile_page.dart';
import './activity/activity_page.dart';
import './inbox/inbox_page.dart';
import './update/update_page.dart';
import './whatsdue/whatsdue_page.dart';
import '../presentation/custom_icons_icons.dart';

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
      bottomNavigationBar: CustomNavBar.BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        onLongPress: (int index) {
          if (index == 4) {
            showModalBottomSheet(context: context, builder: (context) {
              return Container(child: Text("TEST THIS"));
            });
          } else {
            setState(() {
              _selectedPage = index;
            });
          }
        },
        type: CustomNavBar.BottomNavigationBarType.fixed,
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
                        'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg'),
                  ),
                ),
              ),
              title: Text('')),
        ],
      ),
    );
  }
}
