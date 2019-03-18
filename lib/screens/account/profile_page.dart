import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildPageTitle = Padding(
        padding: EdgeInsets.all(32.0),
        child: Text('Profile',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)));

    final profileCard = Card(
      elevation: 8.0,
      margin: EdgeInsets.only(bottom: 20.0, left: 24.0, right: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      'https://www.workingmother.com/sites/workingmother.com/files/styles/1000_1x_/public/images/2016/10/emily_blunt.jpg?itok=uRNPOZ2B&fc=50,50'),
                ),
              ),
            ),
            SizedBox(
              width: 24.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Kamila Nasyidah ',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[_buildPageTitle, profileCard],
            ),
          ),
        ),
      ),
    );
  }
}
