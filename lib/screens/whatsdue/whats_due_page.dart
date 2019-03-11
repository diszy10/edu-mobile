import 'package:flutter/material.dart';

class WhatsDuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildPageTitle = Padding(
        padding: EdgeInsets.all(32.0),
        child: Text('What\'s Due',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              children: <Widget>[_buildPageTitle],
            ),
          ),
        ),
      ),
    );
  }
}
