import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final startText = Text(
      'Welcome to\nEdukasi.',
      style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
    );

    final startButton = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      height: 55.0,
      child: FlatButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/test'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          color: Theme.of(context).primaryColor,
          child: Text('Continue',
              style: TextStyle(color: Colors.white, fontSize: 18.0))),
    );

    return Scaffold(
      body: SafeArea(
        child: FractionallySizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                startText,
                SizedBox(height: 40.0),
                startButton
              ],
            ),
          ),
        ),
      ),
    );
  }
}
