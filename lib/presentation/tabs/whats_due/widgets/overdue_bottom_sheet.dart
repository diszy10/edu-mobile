import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/shared/gradient_text.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/tabs/whats_due/widgets/homework_list.dart';
import 'package:flutter/material.dart';

class OverdueBottomSheet extends StatelessWidget {
  final Overdue overdue;

  OverdueBottomSheet({@required this.overdue});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF737373),
      height: mediaHeight(context) * 4 / 5,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Column(
        children: <Widget>[
          _buildArrowUp(context),
          _buildTextSubject(context),
          _buildTextTopic(context),
          _buildTextDueOn(),
          _buildHomeworkList()
        ],
      ),
    );
  }

  Widget _buildArrowUp(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacement(new MaterialPageRoute<Null>(
              builder: (BuildContext context) =>
                  OverdueFullSheet(overdue: overdue),
              fullscreenDialog: true));
        },
        child: Icon(Icons.keyboard_arrow_up),
      ),
    );
  }

  Widget _buildTextSubject(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: OrangeMagentaGradientText(
        text: overdue.subject,
        fontSize: subjectSize(context),
      ),
    );
  }

  Widget _buildTextTopic(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Text('Topic: ' + overdue.topic,
          style: TextStyle(
            fontSize: topicSize(context),
            color: Color(0xFF87909A),
          ),
          textAlign: TextAlign.center),
    );
  }

  Widget _buildTextDueOn() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0, child: Divider(color: Color(0xFFCCCCCC))),
          Row(
            children: <Widget>[
              SizedBox(width: 16.0),
              Icon(Icons.movie, color: Color(0xFFFF5B30)),
              SizedBox(width: 4.0),
              Text(
                'Due on',
                style: TextStyle(color: Color(0xFF87909A)),
              ),
              SizedBox(width: 2.0),
              Text(overdue.dueDate, style: TextStyle(color: Color(0xFFFF5B30))),
              SizedBox(width: 16.0)
            ],
          ),
          SizedBox(height: 24.0, child: Divider(color: Color(0xFFCCCCCC))),
        ],
      ),
    );
  }

  Widget _buildHomeworkList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: overdue.homework.length,
        itemBuilder: (context, index) =>
            HomeworkList(index + 1, homework: overdue.homework[index]),
      ),
    );
  }
}

class OverdueFullSheet extends StatelessWidget {
  final Overdue overdue;

  OverdueFullSheet({@required this.overdue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close), onPressed: () => Navigator.pop(context))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildTextSubject(context),
            _buildTextTopic(context),
            _buildTextDueOn(),
            _buildHomeworkList()
          ],
        ),
      ),
    );
  }

  Widget _buildTextSubject(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: OrangeMagentaGradientText(
        text: overdue.subject,
        fontSize: subjectSize(context),
      ),
    );
  }

  Widget _buildTextTopic(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Text('Topic: ' + overdue.topic,
          style: TextStyle(
            fontSize: topicSize(context),
            color: Color(0xFF87909A),
          ),
          textAlign: TextAlign.center),
    );
  }

  Widget _buildTextDueOn() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 24.0, child: Divider(color: Color(0xFFCCCCCC))),
          Row(
            children: <Widget>[
              SizedBox(width: 16.0),
              Icon(Icons.movie, color: Color(0xFFFF5B30)),
              SizedBox(width: 4.0),
              Text(
                'Due on',
                style: TextStyle(color: Color(0xFF87909A)),
              ),
              SizedBox(width: 2.0),
              Text(overdue.dueDate, style: TextStyle(color: Color(0xFFFF5B30))),
              SizedBox(width: 16.0)
            ],
          ),
          SizedBox(height: 24.0, child: Divider(color: Color(0xFFCCCCCC))),
        ],
      ),
    );
  }

  Widget _buildHomeworkList() {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: overdue.homework.length,
          itemBuilder: (context, index) =>
              HomeworkList(index + 1, homework: overdue.homework[index])),
    );
  }
}
