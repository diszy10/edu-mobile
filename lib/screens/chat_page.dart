import 'package:flutter/material.dart';
import 'package:edukasi_mobile/models/message.dart';

class ChatPage extends StatefulWidget {
  final Message message;
  const ChatPage({this.message});

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
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ChatHeader(
                    name: widget.message.name,
                    position: widget.message.position,
                    urlPhoto: widget.message.urlPhoto,
                  ),
                ],
              ),
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
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
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
