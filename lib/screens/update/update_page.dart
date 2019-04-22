import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/update.dart';
import 'package:edukasi_mobile/scoped_models/app_model.dart';
import './update_header.dart';

class UpdatePage extends StatefulWidget {
  final AppModel appModel;

  UpdatePage(this.appModel);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  void initState() {
    widget.appModel.fetchUpdates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double targetHeight = deviceHeight > 640.0 ? 122.0 : 98.0;

    Widget _buildUpdateList(List<Update> updateList) {
      return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: updateList.length,
        itemBuilder: (BuildContext context, index) {
          return Dismissible(
            key: Key(updateList[index].id.toString()),
            child: InkWell(
              onTap: () {},
              child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(targetHeight),
        child: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 32.0),
              child: UpdateHeader(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 8.0),
            ScopedModelDescendant<AppModel>(builder: (context, _, model) {
              if (model.isLoading) {
                return Container(
                    padding: new EdgeInsets.all(5.0),
                    child: Center(child: CircularProgressIndicator()));
              } else {
                return _buildUpdateList(model.updateList);
              }
            })
          ],
        )),
      ),
    );
  }
}
