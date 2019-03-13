import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/inbox.dart';

class ChatPage extends StatefulWidget {
  final Inbox inbox;
  const ChatPage({this.inbox});

  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildTextComposer() {
      return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor), //new
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  autofocus: true,
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration:
                      InputDecoration.collapsed(hintText: "Send a message"),
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () => _handleSubmitted(_textController.text),
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ), //new
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Text(
          widget.inbox.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ChatHeader(
            //   name: widget.inbox.name,
            //   position: widget.inbox.position,
            //   urlPhoto: widget.inbox.urlPhoto,
            // ),
            // widget.inbox.message != null
            //     ? Container(
            //         margin: EdgeInsets.only(left: 24.0),
            //         padding: EdgeInsets.all(16.0),
            //         decoration: BoxDecoration(
            //             color: Colors.blueGrey[50],
            //             borderRadius: BorderRadius.circular(10.0)),
            //         child: Text(widget.inbox.message,
            //             style: TextStyle(fontSize: 16.0)),
            //       )
            //     : Container(),
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            _buildTextComposer()
          ],
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(urlPhoto),
                ),
              ),
            ),
          ],
        ));
  }
}

class ChatMessage extends StatelessWidget {
  static DateTime now = DateTime.now();
  String parsedTime = DateFormat('kk:mm').format(now);
  final String text;
  final AnimationController animationController;
  ChatMessage({this.text, this.animationController});

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: new Text(
                    parsedTime,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(left: 8.0, bottom: 8.0),
                  padding: EdgeInsets.all(16.0),
                  constraints: BoxConstraints(maxWidth: 250.0),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(text, style: TextStyle(fontSize: 16.0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
