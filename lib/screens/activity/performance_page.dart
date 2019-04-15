import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

import '../../widgets/gradient_text_color.dart';

class PerformancePage extends StatefulWidget {
  @override
  _PerformancePageState createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;
    final double subtitleFontSize = deviceHeight > 640.0 ? 26.0 : 20.0;
    final double homeworkFontSize = deviceHeight > 640.0 ? 120.0 : 100.0;
    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    final _chartSize = const Size(200.0, 100.0);
    double value = 75.0;

    List<CircularStackEntry> _generateChartData(double value) {
      Color dialColor = Color(0xFF39DEA1);
      if (value < 0) {
        dialColor = Colors.red[200];
      } else if (value < 50) {
        dialColor = Colors.yellow[200];
      }

      List<CircularStackEntry> data = <CircularStackEntry>[
        new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              value,
              dialColor,
              rankKey: 'percentage',
            )
          ],
          rankKey: 'percentage',
        ),
      ];

      if (value > 100) {
        data.add(new CircularStackEntry(
          <CircularSegmentEntry>[
            new CircularSegmentEntry(
              value - 100,
              Colors.green[200],
              rankKey: 'percentage',
            ),
          ],
          rankKey: 'percentage2',
        ));
      }

      return data;
    }

    Widget _performanceHeader = Container(
      margin: EdgeInsets.only(left: 24.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BluePurpleGradientText(
            text: 'Performance',
            fontSize: titleFontSize,
          ),
          SizedBox(height: 4.0),
          Text(
            'Semester 2',
            style: TextStyle(color: Color(0xFF989B9C), fontSize: 16.0),
          )
        ],
      ),
    );

    Widget _homeworksSection = Container(
      margin: EdgeInsets.only(left: 24.0, top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text('Homeworks',
                  style: TextStyle(
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.bold))),
          Row(
            children: <Widget>[
              // Number
              Container(
                child: OrangeMagentaGradientText(
                  text: '14',
                  fontSize: homeworkFontSize,
                ),
              ),
              // Unsubmmited subjects
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Unsubmitted Subjects',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFE8EEF2),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          'Math & Logic',
                          style: TextStyle(color: Color(0xFF555B61)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFE8EEF2),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          'Physics',
                          style: TextStyle(color: Color(0xFF555B61)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFE8EEF2),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Text(
                          'Indonesian',
                          style: TextStyle(color: Color(0xFF555B61)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );

    Widget _attendanceSection = Container(
      margin: EdgeInsets.only(left: 24.0, top: 24.0, bottom: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text('Attendance',
                  style: TextStyle(
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.bold))),
          Container(
            margin: EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: 120.0,
                    margin: EdgeInsets.only(right: 16.0),
                    child: AnimatedCircularChart(
                      key: _chartKey,
                      size: _chartSize,
                      initialChartData: _generateChartData(value),
                      chartType: CircularChartType.Radial,
                      edgeStyle: SegmentEdgeStyle.flat,
                      holeRadius: 8.0,
                      percentageValues: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 24.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              width: 10.0,
                              height: 10.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF39DEA1)),
                            ),
                            Container(child: Text('Attendance', style: TextStyle(fontSize: 16.0),)),
                            Container(child: Text('75%'))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.close), onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _performanceHeader,
              Divider(color: Colors.grey),
              _homeworksSection,
              Divider(color: Colors.grey),
              _attendanceSection,
            ],
          ),
        ),
      ),
    );
  }
}
