import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/inbox.dart';
import '../../widgets/gradient_text_color.dart';

class ChatPage extends StatefulWidget {
  final Inbox inbox;
  const ChatPage({this.inbox});

  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  FocusNode _focusNode;
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
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
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetMargin = deviceHeight > 640.0 ? 0 : 8.0;

    Color _getSendButtonBackground() {
      return _focusNode.hasFocus
          ? Theme.of(context).primaryColor
          : Color(0xFFD4D8DC);
    }

    Widget _buildTextComposer() {
      return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  top: BorderSide(color: Colors.grey.withOpacity(0.5)))),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(24.0),
                child: TextField(
                  focusNode: _focusNode,
                  onChanged: (String text) {
                    setState(() {
                      _isComposing = text.length > 0;
                    });
                  },
                  autofocus: false,
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                  decoration: InputDecoration.collapsed(
                      hintText: "Type your message..."),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.grey),
                            onPressed: () {}),
                        IconButton(
                          icon: Icon(Icons.photo_library, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(24.0),
                    onTap: _isComposing
                        ? () => _handleSubmitted(_textController.text)
                        : null,
                    child: Container(
                      margin: EdgeInsets.only(right: 16.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          color: _getSendButtonBackground(),
                          borderRadius: BorderRadius.circular(24.0)),
                      child: Text(
                        'Send',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Flexible(
              child: Container(
                width: 40.0,
                height: 40.0,
                margin: EdgeInsets.only(right: targetMargin),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.inbox.urlPhoto),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BluePurpleGradientText(
                      text: widget.inbox.name, fontSize: 16.0),
                  Text(
                    widget.inbox.teacher,
                    style: TextStyle(color: Color(0xFF9EA0A1), fontSize: 14.0),
                  )
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(color: Color(0xFFFFF0DA)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.perm_contact_calendar, color: Color(0xFFFA792D)),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        widget.inbox.name +
                            ' is Cantika\'s ' +
                            widget.inbox.teacher,
                        style: TextStyle(color: Color(0xFFBB793E)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )),
            _messages.isNotEmpty
                ? Flexible(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, index) => _messages[index],
                      itemCount: _messages.length,
                    ),
                  )
                : Flexible(
                    child: Center(
                        child: Text(
                    'No message here yet..',
                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                  ))),
            _buildTextComposer()
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  static DateTime now = DateTime.now();
  final String sendTime = DateFormat('kk:mm').format(now);
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 8.0, bottom: 8.0),
                  padding: EdgeInsets.all(16.0),
                  constraints: BoxConstraints(maxWidth: 250.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFDDEEFF),
                      borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(32.0),
                          topEnd: Radius.circular(16.0),
                          bottomStart: Radius.circular(32.0))),
                  child: Text(text, style: TextStyle(fontSize: 16.0)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    sendTime,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
