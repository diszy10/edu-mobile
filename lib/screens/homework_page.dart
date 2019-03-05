import 'package:flutter/material.dart';

class HomeworkPage extends StatelessWidget {
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
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
              child: Column(
                children: <Widget>[
                  PageTitle(text: 'Homeworks'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  final String text;

  const PageTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold));
  }
}
