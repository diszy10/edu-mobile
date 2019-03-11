import 'package:flutter/material.dart';

import '../../models/inbox.dart';
import './chat_page.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _contacts = [
      Inbox(name: 'Mrs. Regina', position: 'Headmaster',
          urlPhoto: 'https://image.shutterstock.com/image-photo/close-portrait-smiling-brunette-woman-260nw-530446444.jpg'),
      Inbox(name: 'Ms. Yuna', position: 'English Teacher',
          urlPhoto: 'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg'),
      Inbox(name: 'Ms. Ariana', position: 'Math Teacher',
          urlPhoto: 'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg'),
      Inbox(name: 'Ms. Luna', position: 'Science Teacher',
          urlPhoto: 'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg'),
      Inbox(name: 'Ms. Reina', position: 'Social Teacher',
          urlPhoto: 'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg'),
    ];

    Widget _buildPageTitle = Padding(
        padding: EdgeInsets.only(left: 32.0, top: 16.0, bottom: 24.0),
        child: Text('Contacts',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)));

    Widget _buildPageContent(List<Inbox> contacts) {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            Inbox contact = contacts[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(
                              inbox: contact,
                            )));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new NetworkImage(contacts[index].urlPhoto),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          contacts[index].name,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          contacts[index].position,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_buildPageTitle, _buildPageContent(_contacts)],
            ),
          ),
        ),
      ),
    );
  }
}
