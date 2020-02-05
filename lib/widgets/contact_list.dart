import 'package:flutter/material.dart';

import 'package:edukasi_mobile/models/models.dart';
import '../pages/chat.dart';

class ContactList extends StatelessWidget {
  final Inbox contact;

  ContactList({@required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                    chat: contact,
                  ),
            ),
          ),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildUserPhoto(),
          SizedBox(width: 16.0),
          _buildUserBody()
        ],
      ),
    );
  }

  Widget _buildUserPhoto() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(contact.urlPhoto),
        ),
      ),
    );
  }

  Widget _buildUserBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /// Teacher name text
        Text(
          contact.teacherName,
          style: TextStyle(
            fontFamily: 'Circular',
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),

        /// Teacher subject text
        Text(
          contact.teacherSubject,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
