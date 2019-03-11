import 'package:flutter/material.dart';

import './activity/activity_page.dart';
import './class_page.dart';
import './message_page.dart';
import './update/update_page.dart';
import './profile_page.dart';
import '../widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  final _pageOptions = [
    ActivityPage(),
    ClassPage(),
    MessagePage(),
    UpdatePage(),
    ProfilePage(),
  ];

  void changeToProfile() {
    setState(() {
      _selectedPage = 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   elevation: 0.4,
      //   centerTitle: true,
      //   title: Text(
      //     'EDUKASI',
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      // ),
      drawer: CustomDrawer(onAvatarTapped: this.changeToProfile),
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
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 24.0,
              ),
              title: Text('Inbox')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none), title: Text('Updates')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Account')),
        ],
      ),
    );
  }
}
