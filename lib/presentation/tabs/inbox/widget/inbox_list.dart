import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';

class InboxList extends StatelessWidget {
  final Inbox inbox;
  final int index;

  InboxList(this.index, {@required this.inbox});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ChatPage(chat: inbox))),
        child: _buildContent());
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        inbox.urlPhoto,
        fit: BoxFit.cover,
        height: 50.0,
        width: 50.0,
      ),
    );
  }

  Widget _buildUserBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /// Teacher name text
              Flexible(
                child: Text(
                  inbox.teacherName,
                  style: TextStyle(
                    fontFamily: 'Circular',
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              /// Timestamp text
              Text(inbox.timestamp)
            ],
          ),
          SizedBox(
            height: 4.0,
          ),
          index == 0
              ? Text(
                  inbox.lastMessage,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                )
              : Text(
                  inbox.lastMessage,
                  style: TextStyle(fontSize: 16.0),
                  overflow: TextOverflow.ellipsis,
                ),
          SizedBox(height: 8.0),
          Divider(
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
}
