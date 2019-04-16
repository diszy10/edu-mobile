import 'package:flutter/material.dart';

import './switch_modal.dart';
import '../activity/performance_page.dart';

import '../../widgets/gradient_text_color.dart';
import '../../widgets/raised_gradient_button.dart';
import '../../widgets/bottom_sheet.dart' as CustomSheet;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;
    final double modalHeight = deviceHeight > 640.0 ? 300.0 : 250.0;

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
      // appBar: AppBar(
      //   brightness: Brightness.light,
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      //   automaticallyImplyLeading: false,
      //   actions: <Widget>[
      //     IconButton(
      //         icon: Icon(Icons.more_horiz),
      //         onPressed: () {
      //           return CustomSheet.showModalBottomSheet(
      //               context: context,
      //               builder: (context) {
      //                 return Container(
      //                   color: Color(0xFF737373),
      //                   height: modalHeight,
      //                   child: Container(
      //                       decoration: BoxDecoration(
      //                           color: Theme.of(context).canvasColor,
      //                           borderRadius: BorderRadius.only(
      //                             topLeft: Radius.circular(10.0),
      //                             topRight: Radius.circular(10.0),
      //                           )),
      //                       child: Container(
      //                           margin: EdgeInsets.only(top: 16.0),
      //                           child: SwitchModal())),
      //                 );
      //               });
      //         }),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Section Account Image
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
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

                      // Account Image
                      Container(
                        width: 80.0,
                        height: 80.0,
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
                      // Account Info
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 16.0, right: 24.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              // Student info
                              Container(
                                margin: EdgeInsets.only(top: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 5.0),
                                    Text(
                                      'Zalina Raine Wyllie',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: 'Circular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text('Class 1A',
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                              ),
                              // Switch student button
                              Container(
                                  margin:
                                      EdgeInsets.only(top: 8.0, bottom: 8.0),
                                  padding: EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        return CustomSheet.showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                color: Color(0xFF737373),
                                                height: modalHeight,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .canvasColor,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        )),
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            top: 16.0),
                                                        child: SwitchModal())),
                                              );
                                            });
                                      },
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 24.0,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Section Stats
                Container(
                  margin: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('6 Years',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          SizedBox(height: 4.0),
                          Text('Age', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('24 kg',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          SizedBox(height: 4.0),
                          Text('Weight', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('60 cm',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.0)),
                          SizedBox(height: 4.0),
                          Text('Height', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                // Section button
                Container(
                  margin: EdgeInsets.only(top: 24.0, left: 32.0, right: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: RaisedGradientButton(
                              child: Text(
                                'Performance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Circular',
                                    fontSize: 14.0),
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF4B7DE2),
                                  Color(0xFF8F6BEB)
                                ],
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          PerformancePage()))),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Flexible(
                        child: Container(
                          height: 42.0,
                          decoration: BoxDecoration(
                              color: Color(0xFFEFF4FC),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () {},
                              child: Center(
                                child: Icon(Icons.history,
                                    color: Color(0xFF4A4A4A)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // Section Account Settings
                // Container(
                //   margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
                //   child: Column(
                //     children: <Widget>[
                //       // Section title
                //       Container(
                //         child: Text(
                //           'Account',
                //           style: TextStyle(fontFamily: 'Circular', fontSize: 24.0),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
