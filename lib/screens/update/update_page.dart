import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/update.dart';
import '../../scoped_models/app_model.dart';
import '../../widgets/gradient_text_color.dart';

class UpdatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double titleFontSize = deviceHeight > 640.0 ? 34.0 : 28.0;

    Widget _buildPageTitle = Padding(
        padding: EdgeInsets.only(left: 24.0, top: 32.0, bottom: 8.0),
        child:
            BluePurpleGradientText(text: 'Updates', fontSize: titleFontSize));

    Widget _buildDate = Padding(
        padding: EdgeInsets.only(left: 24.0, right: 32.0, bottom: 32.0),
        child: Text('Today, 1 March 2019',
            style: TextStyle(color: Color(0xFF3A3E41), fontSize: 16.0)));

    Widget _buildUpdateList(List<Update> updateList) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: updateList.length,
        itemBuilder: (BuildContext context, index) {
          return Dismissible(
            key: Key(updateList[index].id.toString()),
            child: InkWell(
              onTap: () {},
              child: Container(
                  margin:
                      EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(updateList[index].title,
                              style: TextStyle(
                                  fontSize: 18.0, fontFamily: 'Circular')),
                          Text(updateList[index].timestamp)
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(updateList[index].content,
                          style: TextStyle(fontSize: 16.0)),
                    ],
                  )),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildPageTitle,
                _buildDate,
                ScopedModelDescendant<AppModel>(
                    builder: (context, child, model) =>
                        _buildUpdateList(model.updateList))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
