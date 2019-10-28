import 'package:flutter/material.dart';
import 'package:edukasi_mobile/utils/custom_icons.dart';
import 'package:edukasi_mobile/widgets/widgets.dart' as widget;
import 'package:edukasi_mobile/utils/widget_utils.dart' as util;
import 'package:edukasi_mobile/tabs/tabs.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;
  final _pages = [
    ActivityPage(),
    WhatsDuePage(),
    InboxPage(),
    UpdatePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar());
  }

  Widget _buildBottomNavigationBar() {
    return widget.BottomNavigationBar(
      currentIndex: _currentIndex,
      type: widget.BottomNavigationBarType.fixed,
      onTap: (int index) => setState(() => _currentIndex = index),
      onLongPress: (int index) => index == 4
          ? _buildModalSwitchStudent()
          : setState(() => _currentIndex = index),
      iconSize: util.mediaDevice(context) ? 24.0 : 20.0,
      items: [
        BottomNavigationBarItem(
            icon: Icon(CustomIcons.icon_activity, color: Color(0xFFA7AAAC)),
            activeIcon: Icon(CustomIcons.icon_activity,
                color: Theme.of(context).primaryColor),
            title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(CustomIcons.icon_duedate, color: Color(0xFFA7AAAC)),
            activeIcon: Icon(CustomIcons.icon_duedate,
                color: Theme.of(context).primaryColor),
            title: Text('')),
        BottomNavigationBarItem(
            icon: Icon(CustomIcons.icon_inbox, color: Color(0xFFA7AAAC)),
            activeIcon: Icon(CustomIcons.icon_inbox,
                color: Theme.of(context).primaryColor),
            title: Text('')),
        BottomNavigationBarItem(
            icon:
                Icon(CustomIcons.icon_notifications, color: Color(0xFFA7AAAC)),
            activeIcon: Icon(CustomIcons.icon_notifications,
                color: Theme.of(context).primaryColor),
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
                      'https://asianparent-assets-id.dexecure.net/wp-content/uploads/sites/24/2018/08/WhatsApp-Image-2018-08-03-at-22.05.39-886x1024.jpeg'),
                ),
              ),
            ),
            title: Text('')),
      ],
    );
  }

  Future _buildModalSwitchStudent() {
    return widget.showCustomModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: util.mediaHeight(context) / 3,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: widget.SwitchBottomSheet(),
              ),
            ),
          );
        });
  }
}
