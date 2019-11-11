import 'package:edukasi_mobile/core/models/models.dart';
import 'package:edukasi_mobile/presentation/blocs/student/bloc.dart';
import 'package:edukasi_mobile/presentation/shared/shared.dart';
import 'package:edukasi_mobile/presentation/tabs/activity/bloc/bloc.dart';
import 'package:edukasi_mobile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: BlocBuilder(
          bloc: BlocProvider.of<ActivityBloc>(context),
          builder: (context, state) {
            if (state is ActivityLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ActivityLoaded) {
              return _buildActivityList(state.activities);
            }
            return Container();
          }),
    );
  }

  Widget _buildAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBar(context, 'activity')),
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
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /// Page title
                BluePurpleGradientText(
                    text: 'Activity', fontSize: titleSize(context)),
                SizedBox(height: 8.0),

                /// Student name
                Text(state is ActiveStudentLoaded ? state.student.name : '',
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF989B9C))),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActivityList(List<Activity> activity) {
    return ListView.builder(
      key: PageStorageKey('activity_list'),
      shrinkWrap: true,
      itemCount: activity.length,
      itemBuilder: (context, index) => ActivityList(activity: activity[index]),
    );
  }
}
