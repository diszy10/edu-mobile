import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/app_model.dart';

class SwitchModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double photoSize = deviceHeight > 640.0 ? 50.0 : 40.0;
    final double nameFontSize = deviceHeight > 640.0 ? 18.0 : 16.0;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Student list
          Expanded(
            child: ScopedModelDescendant<AppModel>(
                builder: (context, child, model) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: model.studentList.length,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              // Student photo
                              Container(
                                width: photoSize,
                                height: photoSize,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        model.studentList[index].urlPhoto),
                                  ),
                                ),
                              ),
                              SizedBox(width: 24.0),
                              // Student name
                              Text(
                                model.studentList[index].name,
                                style: TextStyle(
                                    fontSize: nameFontSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
          ),

          // Settings
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Container(
          //         decoration: BoxDecoration(
          //             shape: BoxShape.rectangle, color: Color(0xFF838C97)),
          //         child: Icon(Icons.settings, color: Colors.white)),
          //     SizedBox(width: 16.0),
          //     Text('Settings',
          //         style: TextStyle(fontSize: 20.0, color: Color(0xFF838C97)))
          //   ],
          // ),
        ],
      ),
    );
  }
}
