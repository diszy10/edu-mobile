import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/app_model.dart';
import '../../models/inbox.dart';
import '../../widgets/gradient_text_color.dart';
import './contact_page.dart';
import './chat_page.dart';

class InboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;
    final double nameFontSize = deviceHeight > 640.0 ? 20.0 : 16.0;

    // final _inbox = [
    //   Inbox(
    //       name: 'Latika Puspasari',
    //       teacher: 'Homeroom Teacher',
    //       urlPhoto:
    //           'https://image.shutterstock.com/image-photo/close-portrait-smiling-brunette-woman-260nw-530446444.jpg',
    //       message: 'Latest message chat goes here',
    //       timestamp: '1d'),
    //   Inbox(
    //       name: 'Vanya Sitorus',
    //       teacher: 'Math Teacher',
    //       urlPhoto:
    //           'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg',
    //       message: 'Baik, sama2 bu',
    //       timestamp: '15 Mar'),
    //   Inbox(
    //       name: 'Natalia Napitupulu',
    //       teacher: 'English Teacher',
    //       urlPhoto:
    //           'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg',
    //       message: 'Terimakasih kembali',
    //       timestamp: '15 Mar'),
    // ];

    Widget _inboxHeader = Container(
      margin: EdgeInsets.only(left: 24.0, bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BluePurpleGradientText(
            text: 'Inbox',
            fontSize: titleFontSize,
          ),
          Text(
            'You have 1 unread message',
            style: TextStyle(color: Color(0xFF989B9C), fontSize: 16.0),
          )
        ],
      ),
    );

    Widget _buildChatList(List<Inbox> inbox) {
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
              margin: EdgeInsets.symmetric(vertical: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.network(
                      inbox[index].urlPhoto,
                      fit: BoxFit.cover,
                      height: 60.0,
                      width: 60.0,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                inbox[index].name,
                                style: TextStyle(
                                    fontSize: nameFontSize,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(inbox[index].timestamp)
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        inbox[index] == inbox[0]
                            ? Text(
                                inbox[index].message,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text(
                                inbox[index].message,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                        SizedBox(height: 8.0),
                        Divider(
                          height: 24.0,
                          color: Colors.grey,
                        )
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ContactPage()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_inboxHeader, ScopedModelDescendant<AppModel>(builder: (context, child, model) => _buildChatList(model.inboxList))],
          ),
        ),
      ),
    );
  }
}
