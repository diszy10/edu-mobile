import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/shared/gradient_text.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final Inbox chat;

  ChatPage({@required this.chat});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final List _messages = <ChatMessage>[];
  static bool _isComposing = false;
  static FocusNode _focusNode;

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  @override
  void initState() {
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(108.0),
      child: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: _buildTopSpace(context),
      ),
    );
  }

  Widget _buildTopSpace(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[_buildAppBarContent(context), _buildTeacherInfo()],
      ),
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          /// Icon back
          IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 16.0),
              onPressed: () => Navigator.pop(context)),

          /// Teacher photo
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.chat.urlPhoto),
              ),
            ),
          ),

          /// Teacher name & subject text
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BluePurpleGradientText(
                    text: widget.chat.teacherName, fontSize: 18.0),
                Text(
                  widget.chat.teacherSubject,
                  style: TextStyle(color: Color(0xFF9EA0A1)),
                )
              ],
            ),
          ),

          /// Icon action more
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _buildTeacherInfo() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: Color(0xFFFFF0DA)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.perm_contact_calendar, color: Color(0xFFFA792D)),
          SizedBox(width: 8.0),

          /// Teacher name text
          Expanded(
            child: Text(
              widget.chat.teacherName +
                  ' is Raine\'s ' +
                  widget.chat.teacherSubject,
              style: TextStyle(color: Color(0xFFBB793E)),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
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
                    ),
                  ),
                ),
          _buildTextInput(context)
        ],
      ),
    );
  }

  Widget _buildTextInput(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: mediaDevice(context) ? 0.0 : 8.0),
      child: Column(
        children: <Widget>[_buildTextComposer(), _buildActionButton(context)],
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
            top: BorderSide(color: Colors.grey.withOpacity(0.5))),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          controller: _textController,
          onSubmitted: _handleSubmitted,
          onChanged: (String text) {
            setState(() {
              _isComposing = text.length > 0;
            });
          },
          focusNode: _focusNode,
          autofocus: false,
          decoration:
              InputDecoration.collapsed(hintText: "Type your message..."),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
        Container(
          margin: EdgeInsets.only(right: 16.0),
          decoration: BoxDecoration(
              color: _getSendButtonBackground(),
              borderRadius: BorderRadius.circular(24.0)),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24.0),
              onTap: _isComposing
                  ? () => _handleSubmitted(_textController.text)
                  : null,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  child: Text('Send', style: TextStyle(color: Colors.white))),
            ),
          ),
        ),
      ],
    );
  }

  Color _getSendButtonBackground() {
    return _focusNode.hasFocus
        ? Theme.of(context).primaryColor
        : Color(0xFFD4D8DC);
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({@required this.text});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String sendTime = DateFormat('kk:mm').format(now);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              /// Message text
              Container(
                padding: EdgeInsets.fromLTRB(24.0, 16.0, 16.0, 16.0),
                constraints: BoxConstraints(maxWidth: 250.0),
                decoration: BoxDecoration(
                    color: Color(0xFFDDEEFF),
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(32.0),
                      bottomStart: Radius.circular(32.0),
                      bottomEnd: Radius.circular(16.0),
                    )),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),

              /// Send time text
              Container(
                margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
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
    );
  }
}
