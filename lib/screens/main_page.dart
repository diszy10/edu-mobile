import 'package:edukasi_mobile/widgets/bottom_navigation_bar.dart'
    as CustomNavBar;
import 'package:edukasi_mobile/widgets/bottom_sheet.dart' as CustomSheet;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped_models/app_model.dart';
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
    final double modalHeight = deviceHeight > 640.0 ? 350.0 : 250.0;

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

class SwitchModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double photoSize = deviceHeight > 640.0 ? 50.0 : 40.0;
    final double nameFontSize = deviceHeight > 640.0 ? 18.0 : 16.0;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Student list
          Expanded(
            child: ScopedModelDescendant<AppModel>(
                builder: (context, child, model) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: model.studentList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            // Student photo
                            Container(
                              width: photoSize,
                              height: photoSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      model.studentList[index].urlPhoto),
                                ),
                              ),
                            ),
                            SizedBox(width: 24.0),
                            // Student name
                            Text(
                              model.studentList[index].name,
                              style: TextStyle(
                                  fontSize: nameFontSize,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }),
          ),

          // Settings
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Container(
          //         decoration: BoxDecoration(
          //             shape: BoxShape.rectangle, color: Color(0xFF838C97)),
          //         child: Icon(Icons.settings, color: Colors.white)),
          //     SizedBox(width: 16.0),
          //     Text('Settings',
          //         style: TextStyle(fontSize: 20.0, color: Color(0xFF838C97)))
          //   ],
          // ),
        ],
      ),
    );
  }
}
