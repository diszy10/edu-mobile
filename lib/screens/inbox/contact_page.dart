import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../scoped_models/app_model.dart';
import '../../models/inbox.dart';
import '../../widgets/gradient_text_color.dart';
import './chat_page.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double photoSize = deviceHeight > 640.0 ? 60.0 : 50.0;
    final double nameFontSize = deviceHeight > 640.0 ? 20.0 : 16.0;

    Widget _buildSearchBar() {
      return Container(
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
          alignment: AlignmentDirectional.centerStart,
          decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search teacher',
            ),
          ));
    }

    Widget _buildContactList(List<Inbox> contacts) {
      return ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            Inbox contact = contacts[index];
            return InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatPage(
                              inbox: contact,
                            )));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: photoSize,
                      height: photoSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(contacts[index].urlPhoto),
                        ),
                      ),
                    ),
                    SizedBox(width: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          contacts[index].name,
                          style: TextStyle(
                              fontSize: nameFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          contacts[index].teacher,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 18.0,
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0.0,
        title: BluePurpleGradientText(
          text: 'New Message',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FractionallySizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildSearchBar(),
                ScopedModelDescendant<AppModel>(
                    builder: (context, child, model) =>
                        _buildContactList(model.contactList))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
