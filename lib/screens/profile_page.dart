import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileCard = Card(
      elevation: 8.0,
      margin:EdgeInsets.only(bottom: 20.0, left: 24.0, right: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 90.0,
              height: 90.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg'),
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
                    'Zalina Raine Wyllie',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'I love to play and learn math!',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          color: Theme.of(context).primaryColor.withOpacity(0.1),
                          child: Text('Edit Profile', style: TextStyle(color: Theme.of(context).primaryColor),),
                          onPressed: () {},
                        ),
                        // Icon(Icons.arrow_forward,)
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
    
    final settingCard = Card(
      elevation: 8.0,
      margin:EdgeInsets.only(bottom: 20.0, left: 24.0, right: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Settings',
                    style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24.0),
                  // Row(
                  //   children: <Widget>[
                  //     Icon(Icons.account_circle, size: 50.0, color: Colors.deepOrange[200]),
                  //     SizedBox(width: 16.0),
                  //     Text('Account', style: TextStyle(fontSize: 18.0),)
                  //   ],
                  // ),
                  // SizedBox(height: 16.0),
                  // Row(
                  //   children: <Widget>[
                  //     Icon(Icons.check_circle, size: 50.0, color: Colors.pink[200]),
                  //     SizedBox(width: 16.0),
                  //     Text('Email', style: TextStyle(fontSize: 18.0),)
                  //   ],
                  // ),
                  // SizedBox(height: 16.0),
                  // Row(
                  //   children: <Widget>[
                  //     Icon(Icons.cloud_circle, size: 50.0, color: Colors.green[200]),
                  //     SizedBox(width: 16.0),
                  //     Text('Phone', style: TextStyle(fontSize: 18.0),)
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[PageTitle(text: 'Profile'), profileCard, settingCard],
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
    return Padding(
        padding: const EdgeInsets.only(left: 24.0, bottom: 32.0),
        child: Text(text,
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)));
  }
}
