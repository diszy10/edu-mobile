import 'package:flutter/material.dart';

import '../../widgets/gradient_text_color.dart';
import '../../widgets/raised_gradient_button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;

    final pageTitle = Padding(
        padding: EdgeInsets.only(left: 24.0, top: 32.0, bottom: 32.0),
        child:
            BluePurpleGradientText(text: 'Profile', fontSize: titleFontSize));

    final profileCard = Card(
      elevation: 8.0,
      margin: EdgeInsets.only(bottom: 20.0, left: 24.0, right: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg',
                fit: BoxFit.cover,
                height: 50.0,
                width: 50.0,
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
                    'Cantika Fonda',
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
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // pageTitle,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(24.0),
                  //   child: Image.network(
                  //     'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg',
                  //     fit: BoxFit.cover,
                  //     height: 60.0,
                  //     width: 60.0,
                  //   ),
                  // ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg'),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFCCCCCC),
                          blurRadius:
                              16.0, // has the effect of softening the shadow
                          offset: Offset(
                            0.0, // horizontal, move right 10
                            10.0, // vertical, move down 10
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 5.0),
                          Text(
                            'Zalina Raine Wyllie',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            'Class 1A',
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 64.0, left: 32.0, right: 24.0),
            //   width: 160.0,
            //   child: RaisedGradientButton(
            //       child: Text(
            //         '',
            //         style:
            //             TextStyle(color: Colors.white, fontFamily: 'Circular', fontSize: 14.0),
            //       ),
            //       gradient: LinearGradient(
            //         colors: <Color>[Color(0xFF4B7DE2), Color(0xFF8F6BEB)],
            //       ),
            //       onPressed: () {}),
            // ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8.0)
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
