import 'package:flutter/material.dart';

import 'package:edukasi_mobile/models/models.dart';
import 'package:edukasi_mobile/widgets/widgets.dart';
import 'package:edukasi_mobile/utils/widget_utils.dart' as util;
import 'package:edukasi_mobile/pages/contact.dart';

class InboxPage extends StatelessWidget {
  final _inboxList = [
    Inbox(
        teacherName: 'Latika Puspasari',
        teacherSubject: 'Homeroom Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/close-portrait-smiling-brunette-woman-260nw-530446444.jpg',
        lastMessage: 'Sama-sama ibu.',
        timestamp: '1d'),
    Inbox(
        teacherName: 'Vanya Sitorus',
        teacherSubject: 'Math Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg',
        lastMessage: 'Baik, sama2 bu',
        timestamp: '15 Mar'),
    Inbox(
        teacherName: 'Natalia Napitupulu',
        teacherSubject: 'English Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg',
        lastMessage: 'Terimakasih kembali',
        timestamp: '15 Mar')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: _buildInboxList(_inboxList),
    );
  }

  Widget _buildAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(util.appBar(context, 'inbox')),
      child: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        flexibleSpace: _buildTopSpace(context),
      ),
    );
  }

  Widget _buildTopSpace(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Icon add
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    ),
              ),
            ),

            /// Page title
            BluePurpleGradientText(
                text: 'Inbox', fontSize: util.titleSize(context)),
            SizedBox(height: 8.0),

            /// Unread message indicator text
            Text(
              'You have 1 unread message',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF989B9C),
              ),
            ),
            SizedBox(height: 16.0)
          ],
        ),
      ),
    );
  }

  Widget _buildInboxList(List<Inbox> inbox) {
    return ListView.builder(
      key: PageStorageKey('inbox_list'),
      shrinkWrap: true,
      itemCount: inbox.length,
      itemBuilder: (context, index) => InboxList(index, inbox: inbox[index]),
    );
  }
}
