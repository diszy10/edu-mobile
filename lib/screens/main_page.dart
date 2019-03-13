import 'package:flutter/material.dart';

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
              icon: Icon(Icons.view_stream), title: Text('Activity')),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), title: Text('What\'s Due')),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), title: Text('Inbox')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), title: Text('Updates')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Account')),
        ],
      ),
    );
  }
}
