import 'package:edukasi_mobile/widgets/bottom_navigation_bar.dart'
    as CustomNavBar;
import 'package:edukasi_mobile/widgets/bottom_sheet.dart' as CustomSheet;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './account/profile_page.dart';
import './account/switch_modal.dart';
import './activity/activity_page.dart';
import './inbox/inbox_page.dart';
import './update/update_page.dart';
import './whatsdue/whatsdue_page.dart';
import '../presentation/custom_icons_icons.dart';

import '../scoped_models/app_model.dart';

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
    UpdatePage(AppModel()),
    ProfilePage()
  ];

  // final PageController pageController =
  //     PageController(initialPage: 0, keepPage: true);
  // int page = 0;

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double iconSize = deviceHeight > 640.0 ? 24.0 : 20.0;
    final double modalHeight = deviceHeight > 640.0 ? 300.0 : 250.0;

    // List<Widget> pages = [
    //   ActivityPage(),
    //   WhatsDuePage(),
    //   InboxPage(),
    //   UpdatePage(),
    //   ProfilePage()
    // ];

    return Scaffold(
      // body: PageView(
      //   onPageChanged: (i) => setState(() => page = i),
      //   controller: pageController,
      //   children: pages,
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark, child: _pageOptions[_selectedPage]),
      bottomNavigationBar: CustomNavBar.BottomNavigationBar(
        // currentIndex: page,
        // onTap: (i) => pageController.animateToPage(i,
        //     duration: const Duration(milliseconds: 300),
        //     curve: Curves.easeInOut),
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        onLongPress: (int index) {
          if (index == 4) {
            CustomSheet.showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    color: Color(0xFF737373),
                    height: modalHeight,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            )),
                        child: Container(
                            margin: EdgeInsets.only(top: 16.0),
                            child: SwitchModal())),
                  );
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