import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBar(context, 'update')),
      child: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: _buildTopSpace(context),
      ),
    );
  }

  Widget _buildTopSpace(context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.only(left: 16.0, top: target ? 32.0 : 24.0),
        padding: EdgeInsets.only(left: 16.0, top: 24.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.grey[300], width: 1.0),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// Page title
            BluePurpleGradientText(
                text: 'Updates', fontSize: titleSize(context)),
            SizedBox(height: 8.0),

            /// Notification indicator text
            Text(
              'No notifications yet.',
              style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF989B9C),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Text(
        'Update Page',
        style: TextStyle(fontSize: 16.0, color: Colors.grey),
      ),
    );
  }
}
