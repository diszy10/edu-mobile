import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Zalina Raine Wyllie',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CircleAvatar(
                    radius: 36.0,
                    child: GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(context, '/profile'),
                    ),
                    backgroundImage: NetworkImage(
                        'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg'),
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, '/attendance'),
              title: Text(
                'Attendances',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, '/homework'),
              title: Text(
                'Homeworks',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Divider(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            ListTile(
              onTap: () => Navigator.popAndPushNamed(context, '/start'),
              title: Text(
                'Log out',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
