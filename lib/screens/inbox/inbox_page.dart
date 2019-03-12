import 'package:flutter/material.dart';

import '../../models/inbox.dart';
import './contact_page.dart';
import './chat_page.dart';

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _inbox = [
      Inbox(
          name: 'Ms. Reina',
          position: 'Social Teacher',
          message: 'Have a good day',
          urlPhoto:
              'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg'),
      Inbox(
          name: 'Ms. Yuna',
          position: 'English Teacher',
          message: 'Thank you',
          urlPhoto:
              'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg')
    ];

    Widget _buildPageContent(List<Inbox> inbox) {
      return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: inbox.length,
        itemBuilder: (BuildContext context, int index) {
          Inbox chat = inbox[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatPage(
                            inbox: chat,
                          )));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(inbox[index].urlPhoto),
                      ),
                    ),
                  ),
                  SizedBox(width: 24.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              inbox[index].name,
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text('Yesterday')
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          inbox[index].message,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[InboxHeader(), _buildPageContent(_inbox)],
            ),
          ),
        ),
      ),
    );
  }
}

class InboxHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 32.0, top: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Inbox',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ButtonTheme.bar(
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  child: Text(
                    'New',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContactPage()));
                  },
                ),
                // Icon(Icons.arrow_forward,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
