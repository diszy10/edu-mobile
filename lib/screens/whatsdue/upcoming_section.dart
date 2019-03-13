import 'package:flutter/material.dart';

class UpcomingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8F9),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'WED',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '$index',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Today',
                        style: TextStyle(color: Colors.grey),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: Color(0xFFEEEFEF), width: 1.5)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 16.0, top: 14.0, bottom: 14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Math & Logic',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('1 homeworks')
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: 2, // this is a hardcoded value
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 3, // this is a hardcoded value
      ),
    );

    // final _upcoming = [
    //   Upcoming('Today', 'WED', '12', 'Math & Logic', '2 homeworks'),
    //   Upcoming('Tommorow', 'THU', '13', 'Physics', '2 homeworks')
    // ];

    // Widget _buildContent() {
    //   return ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: 2,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Row(
    //         children: <Widget>[
    //           // Day, Date column
    //           Column(
    //             children: <Widget>[Text('Day $index'), Text('$index')],
    //           ),
    //           ListView.builder(
    //             shrinkWrap: true,
    //             itemCount: 4,
    //             itemBuilder: (BuildContext context, int index) {
    //               return Column(
    //                 children: <Widget>[
    //                   Text('Today $index'),
    //                   Card(
    //                     elevation: 8.0,
    //                     color: Colors.white,
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(8.0)),
    //                     child: Column(
    //                       children: <Widget>[
    //                         Text('Math $index'),
    //                         Text('$index homework')
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               );
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    // return Scaffold(
    //   backgroundColor: Color(0xFFF7F8F9),
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    // TODO: Call Listbuilder
    //       _buildContent()
    // Row(
    //   children: <Widget>[
    //     // DATE
    //     Container(
    //       margin: EdgeInsets.only(left: 24.0, right: 16.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Text('WED', style: TextStyle(color: Colors.indigo)),
    //           Text('12',
    //               style: TextStyle(
    //                   color: Colors.indigo,
    //                   fontSize: 24.0,
    //                   fontWeight: FontWeight.bold))
    //         ],
    //       ),
    //     ),
    //     Container(
    //       margin: EdgeInsets.only(top: 32.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           // Day
    //           Text('Today', style: TextStyle(color: Colors.grey)),
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pushNamed(context, '/homework');
    //             },
    //             child: Container(
    //               padding: EdgeInsets.all(16.0),
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 shape: BoxShape.rectangle,
    //                 borderRadius: BorderRadius.circular(10.0),
    //               ),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Text(
    //                     'Math & Logic',
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 18.0),
    //                   ),
    //                   Text(
    //                     '2 homeworks',
    //                     style: TextStyle(color: Colors.grey),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ],
    // )
    //     ],
    //   ),
    // );
  }
}
