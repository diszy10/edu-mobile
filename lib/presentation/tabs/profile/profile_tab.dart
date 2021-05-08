import 'package:edukasi_mobile/presentation/blocs/auth/bloc.dart';
import 'package:edukasi_mobile/presentation/blocs/student/bloc.dart';
import 'package:edukasi_mobile/presentation/shared/gradient_text.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBar(context, 'profile')),
      child: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: _buildTopSpace(context),
      ),
    );
  }

  Widget _buildTopSpace(context) {
    return BlocBuilder(
      bloc: BlocProvider.of<StudentBloc>(context),
      builder: (_, state) {
        return SafeArea(
          child: Container(
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
                    text: 'Profile', fontSize: titleSize(context)),
                SizedBox(height: 8.0),

                /// Student name
                Text(
                  state is ActiveStudentLoaded ? state.student.name : '',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF989B9C),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody(context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
        },
        child: Text('Log out'),
      ),
    );
  }
}
