import 'package:flutter/material.dart';

import '../../models/inbox.dart';

class ChatPage extends StatefulWidget {
  final Inbox inbox;
  const ChatPage({this.inbox});

  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              children: <Widget>[
                ChatHeader(
                  name: widget.inbox.name,
                  position: widget.inbox.position,
                  urlPhoto: widget.inbox.urlPhoto,
                ),
                widget.inbox.message != null
                    ? Container(
                        margin: EdgeInsets.only(left: 24.0),
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[50],
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.inbox.message,
                                style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatHeader extends StatelessWidget {
  final String name;
  final String position;
  final String urlPhoto;

  const ChatHeader({Key key, this.name, this.position, this.urlPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 24.0, bottom: 32.0, right: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  position,
                  style: TextStyle(fontSize: 18.0),
                )
              ],
            ),
            Container(
              width: 90.0,
              height: 90.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(urlPhoto),
                ),
              ),
            ),
          ],
        ));
  }
}
