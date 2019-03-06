import 'package:flutter/material.dart';

class StreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final switchKids = Padding(
        padding: EdgeInsets.only(left: 32.0, top: 24.0),
        child: Container(
          width: 60.0,
          height: 60.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(
                  'https://f4m6r3s3.stackpathcdn.com/wp-content/uploads/2018/11/gempi-696x391.jpg'),
            ),
          ),
        ));

    final todayClass = Padding(
      padding: const EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
      child: Text('Today class',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
    );

    // final homeworkFeed = InkWell(
    //   onTap: () => Navigator.pushNamed(context, '/homework'),
    //   splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
    //   child: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
    //     decoration: BoxDecoration(
    //         border: Border(
    //             left: BorderSide(
    //                 width: 5.0, color: Theme.of(context).primaryColor))),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             Text(
    //               'Math & Logic',
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    //             ),
    //             Text(
    //               '1 hour ago',
    //               style: TextStyle(color: Color(0xFF3A3E41)),
    //             )
    //           ],
    //         ),
    //         SizedBox(
    //           height: 5.0,
    //         ),
    //         Text(
    //           'Ms. Alex',
    //           style: TextStyle(color: Color(0xFF3A3E41)),
    //         ),
    //         SizedBox(
    //           height: 5.0,
    //         ),
    //         Text('Teach "Decimal fractions and place value patterns"', style: TextStyle(fontSize: 18.0)),
    //       ],
    //     ),
    //   ),
    // );

    final mathFeed = InkWell(
      onTap: () => Navigator.pushNamed(context, '/homework'),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 5.0, color: Theme.of(context).primaryColor))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        'https://image.shutterstock.com/image-photo/indoor-portrait-beautiful-brunette-young-260nw-640005220.jpg'),
                  ),
                ),
              ),
              SizedBox(
                width: 28.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Math & Logic',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '1 hour ago',
                          style: TextStyle(color: Color(0xFF3A3E41)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Ms. Ariana',
                      style: TextStyle(color: Color(0xFF3A3E41)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Teach "Decimal fractions and place value patterns"',
                        style: TextStyle(fontSize: 16.0)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('2 exercise'),
                        SizedBox(
                          width: 24.0,
                        ),
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('1 homework'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );

    final scienceFeed = InkWell(
      onTap: () => Navigator.pushNamed(context, '/homework'),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(width: 5.0, color: Color(0xFF5BEDD7)))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        'https://image.shutterstock.com/image-photo/pleased-help-you-portrait-polite-260nw-1221332758.jpg'),
                  ),
                ),
              ),
              SizedBox(
                width: 28.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Science',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3 hour ago',
                          style: TextStyle(color: Color(0xFF3A3E41)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Ms. Luna',
                      style: TextStyle(color: Color(0xFF3A3E41)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Teach "Decimal fractions and place value patterns"',
                        style: TextStyle(fontSize: 16.0)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('2 exercise'),
                        SizedBox(
                          width: 24.0,
                        ),
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('1 homework'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );

    final englishFeed = InkWell(
      onTap: () => Navigator.pushNamed(context, '/homework'),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.3),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(width: 5.0, color: Color(0xFFE9ED5B)))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: new NetworkImage(
                        'https://image.shutterstock.com/image-photo/headshot-portrait-happy-ginger-girl-260nw-623804987.jpg'),
                  ),
                ),
              ),
              SizedBox(
                width: 28.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'English',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '3 hour ago',
                          style: TextStyle(color: Color(0xFF3A3E41)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Ms. Yuna',
                      style: TextStyle(color: Color(0xFF3A3E41)),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Teach "Decimal fractions and place value patterns"',
                        style: TextStyle(fontSize: 16.0)),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('2 exercise'),
                        SizedBox(
                          width: 24.0,
                        ),
                        Icon(
                          Icons.library_books,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('1 homework'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                switchKids,
                todayClass,
                Date(text: '5 March 2019'),
                mathFeed,
                scienceFeed,
                englishFeed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Date extends StatelessWidget {
  final String text;

  const Date({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, bottom: 24.0),
      child: Text(text,
          style: TextStyle(
              color: Color(0xFF3A3E41),
              fontSize: 16.0,
              fontWeight: FontWeight.normal)),
    );
  }
}
