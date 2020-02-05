import 'package:flutter/material.dart';

import 'package:edukasi_mobile/models/models.dart';
import 'package:edukasi_mobile/widgets/widgets.dart';

class ContactPage extends StatelessWidget {
  final _contactList = [
    Inbox(
        teacherName: 'Latika Puspasari',
        teacherSubject: 'Homeroom Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/close-portrait-smiling-brunette-woman-260nw-530446444.jpg'),
    Inbox(
        teacherName: 'Vanya Sitorus',
        teacherSubject: 'Math Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg'),
    Inbox(
        teacherName: 'Natalia Napitupulu',
        teacherSubject: 'English Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg'),
    Inbox(
        teacherName: 'Tirtayasa Saragih',
        teacherSubject: 'Science Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg'),
    Inbox(
        teacherName: 'Margana Wastuti',
        teacherSubject: 'Art Teacher',
        urlPhoto:
            'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 16.0),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: BluePurpleGradientText(
          text: 'New Message',
          fontSize: 20.0,
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _buildSearchBar(),
          SizedBox(height: 16.0),
          _buildContactList(_contactList)
        ],
      ),
    );
  }

  // TODO: Add feature dynamic search list
  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search teacher',
        ),
      ),
    );
  }

  Widget _buildContactList(List<Inbox> contact) {
    return Expanded(
      child: ListView.builder(
        key: PageStorageKey('inbox_list'),
        shrinkWrap: true,
        itemCount: contact.length,
        itemBuilder: (context, index) => ContactList(contact: contact[index]),
      ),
    );
  }
}
