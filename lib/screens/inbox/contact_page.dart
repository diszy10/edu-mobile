import 'package:flutter/material.dart';

import '../../models/inbox.dart';
import '../../widgets/gradient_text_color.dart';
import './chat_page.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double photoSize = deviceHeight > 640.0 ? 60.0 : 50.0;
    final double nameFontSize = deviceHeight > 640.0 ? 20.0 : 16.0;

    final _contacts = [
      Inbox(
          name: 'Latika Puspasari',
          teacher: 'Homeroom Teacher',
          urlPhoto:
              'https://image.shutterstock.com/image-photo/close-portrait-smiling-brunette-woman-260nw-530446444.jpg'),
      Inbox(
          name: 'Vanya Sitorus',
          teacher: 'Math Teacher',
          urlPhoto:
              'https://image.shutterstock.com/image-photo/portrait-young-beautiful-cute-cheerful-260nw-666258808.jpg'),
      Inbox(
          name: 'Natalia Napitupulu',
          teacher: 'English Teacher',
          message: 'Thank you',
          urlPhoto:
              'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg'),
      Inbox(
          name: 'Tirtayasa Saragih',
          teacher: 'Science Teacher',
          urlPhoto:
              'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg'),
      Inbox(
          name: 'Margana Wastuti',
          teacher: 'Art Teacher',
          urlPhoto:
              'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg'),
    ];

    Widget _buildSearchBar() {
      return Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search teacher',
            ),
          ));
    }

    Widget _buildContactList(List<Inbox> contacts) {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            Inbox contact = contacts[index];
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(
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
                      width: photoSize,
                      height: photoSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(contacts[index].urlPhoto),
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
                              fontSize: nameFontSize, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          contacts[index].teacher,
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
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        title: BluePurpleGradientText(
          text: 'New Message',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSearchBar(),
                _buildContactList(_contacts)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
